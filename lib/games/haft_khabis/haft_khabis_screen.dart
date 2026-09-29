import 'package:flutter/material.dart';

/// هفت خبیث (Haft Khabis / Evil Seven) – Iranian card game similar to Mau-Mau.
/// Special card 7 forces next player to draw 2.
class HaftKhabisScreen extends StatelessWidget {
  const HaftKhabisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('هفت خبیث')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'هفت خبیث\n\nقوانین کلاسیک ایرانی\nکارت ۷ = خبیث (۲ کارت جریمه)\n۲ تا ۶ بازیکن\n\nبه زودی با پشتیبانی کامل چندنفره',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
