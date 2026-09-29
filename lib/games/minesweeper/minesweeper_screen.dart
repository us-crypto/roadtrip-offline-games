import 'package:flutter/material.dart';

/// Classic Minesweeper (the old Windows bomb / mine game).
/// Single-player for now, perfect for short waits on a road trip.
class MinesweeperScreen extends StatelessWidget {
  const MinesweeperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مین‌روب')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'مین‌روب کلاسیک\n\nهمان بازی قدیمی ویندوز\nبا تم هخامنشی\n\nبه زودی',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
