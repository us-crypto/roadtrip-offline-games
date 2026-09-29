import 'package:flutter/material.dart';

class ChessScreen extends StatelessWidget {
  const ChessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('شطرنج')),
      body: const Center(
        child: Text(
          'Clean Chess with Achaemenid styling\nComing soon',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
