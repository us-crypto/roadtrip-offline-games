import 'package:flutter/foundation.dart';

/// High-level multiplayer service.
/// Primary transport: Local Hotspot + WebSocket
/// Secondary: BLE discovery via flutter_blue_plus
class MultiplayerService {
  // TODO: implement host/guest lifecycle
  // TODO: WebSocket server/client
  // TODO: BLE scan & advertise helpers
  // TODO: JSON protocol for game state sync

  Future<void> createRoom({required String playerName}) async {
    debugPrint('Creating room as $playerName...');
    // 1. Start local server
    // 2. Optionally start BLE advertising with room code
  }

  Future<void> joinRoom({required String roomCode, required String playerName}) async {
    debugPrint('Joining room $roomCode as $playerName...');
  }

  Future<void> leaveRoom() async {
    debugPrint('Leaving room...');
  }

  Stream<Map<String, dynamic>> get gameStateStream {
    // Placeholder
    return const Stream.empty();
  }

  void sendMove(Map<String, dynamic> move) {
    // Send to host / broadcast
  }
}
