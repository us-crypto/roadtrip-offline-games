import 'package:flutter/material.dart';

/// Placeholder for Backgammon game.
/// Full implementation will include board, dice, multiplayer sync.
class BackgammonScreen extends StatelessWidget {
  const BackgammonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تخته‌نرد')),
      body: const Center(
        child: Text(
          'Backgammon board coming soon...\nAchaemenid styled board + Bluetooth/Hotspot multiplayer',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
