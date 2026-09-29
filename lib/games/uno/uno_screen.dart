import 'package:flutter/material.dart';

class UnoScreen extends StatelessWidget {
  const UnoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Uno')),
      body: const Center(
        child: Text(
          'Uno – 2 to 4 players\nLarge cards • Classic rules • Multiplayer ready',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
