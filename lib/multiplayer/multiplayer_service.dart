import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Multiplayer service – Primary transport: Local Wi-Fi Hotspot + WebSocket.
/// Host creates a room, shows QR + short code containing ws://IP:port/roomId
/// Guest scans QR or enters code and connects.
class MultiplayerService {
  static const int defaultPort = 8765;
  final _uuid = const Uuid();

  String? roomId;
  String? localIp;
  bool isHost = false;
  WebSocketChannel? _channel;
  final _players = <String, String>{}; // id -> name
  final _controller = StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> get events => _controller.stream;

  /// Host: create room and prepare connection info for QR
  Future<Map<String, String>> createRoom({required String playerName}) async {
    isHost = true;
    roomId = _uuid.v4().substring(0, 8).toUpperCase();
    // In real implementation: start a local WebSocket server on defaultPort
    // and obtain local IP via network_info_plus.
    // For now we return a template that the UI will turn into a QR.
    localIp = '192.168.43.1'; // typical hotspot IP – replace with real lookup

    final joinPayload = {
      'type': 'join_info',
      'ip': localIp,
      'port': defaultPort.toString(),
      'room': roomId,
    };

    debugPrint('Room created: $roomId at $localIp:$defaultPort');
    _players[_uuid.v4()] = playerName;

    return {
      'roomId': roomId!,
      'qrData': jsonEncode(joinPayload),
      'displayCode': roomId!,
      'wsUrl': 'ws://$localIp:$defaultPort',
    };
  }

  /// Guest: join using data from QR or manual code
  Future<void> joinRoom({
    required String qrOrCode,
    required String playerName,
  }) async {
    isHost = false;
    try {
      final data = jsonDecode(qrOrCode) as Map<String, dynamic>;
      final ip = data['ip'] as String;
      final port = int.parse(data['port'].toString());
      roomId = data['room'] as String;

      final uri = Uri.parse('ws://$ip:$port');
      _channel = WebSocketChannel.connect(uri);

      _channel!.stream.listen(
        (message) {
          final msg = jsonDecode(message as String) as Map<String, dynamic>;
          _controller.add(msg);
        },
        onError: (e) => debugPrint('WS error: $e'),
        onDone: () => debugPrint('WS closed'),
      );

      // Send join message
      send({
        'type': 'join',
        'name': playerName,
        'room': roomId,
      });

      debugPrint('Joined room $roomId');
    } catch (e) {
      // Fallback: treat as plain room code (manual entry)
      debugPrint('Join failed or plain code: $e');
      rethrow;
    }
  }

  void send(Map<String, dynamic> message) {
    if (_channel != null) {
      _channel!.sink.add(jsonEncode(message));
    } else if (isHost) {
      // Host broadcasts locally / to connected clients (implement server side)
      _controller.add(message);
    }
  }

  void sendMove(Map<String, dynamic> move) {
    send({'type': 'move', ...move});
  }

  Future<void> leaveRoom() async {
    await _channel?.sink.close();
    _channel = null;
    roomId = null;
    isHost = false;
    _players.clear();
  }

  void dispose() {
    leaveRoom();
    _controller.close();
  }
}
