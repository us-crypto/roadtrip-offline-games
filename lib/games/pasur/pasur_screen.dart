import 'package:flutter/material.dart';

class PasurScreen extends StatelessWidget {
  const PasurScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('پاسور')),
      body: const Center(
        child: Text(
          'پاسور چهاربرگ\n2 & 4 player support coming soon',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
