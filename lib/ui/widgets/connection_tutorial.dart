import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/theme/achaemenid_theme.dart';

/// Shows a user-friendly tutorial the first time the app is opened.
/// Can also be opened later from the help icon on the home screen.
class ConnectionTutorial {
  static const _prefKey = 'has_seen_connection_tutorial';

  static Future<bool> shouldShow() async {
    final prefs = await SharedPreferences.getInstance();
    return !(prefs.getBool(_prefKey) ?? false);
  }

  static Future<void> markAsSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, true);
  }

  static Future<void> show(BuildContext context, {bool force = false}) async {
    if (!force && !await shouldShow()) return;

    if (!context.mounted) return;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: AchaemenidTheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AchaemenidTheme.gold, width: 2),
        ),
        title: const Text(
          'چطور با دوستان بازی کنیم؟',
          textAlign: TextAlign.center,
          style: TextStyle(color: AchaemenidTheme.gold, fontSize: 20),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _step('۱', 'یکی از گوشی‌ها «میزبان» می‌شود و هات‌اسپات را روشن می‌کند.'),
              _step('۲', 'میزبان روی «ساخت اتاق» می‌زند و یک کد QR + کد کوتاه می‌بیند.'),
              _step('۳', 'دوستانت به هات‌اسپات میزبان وصل می‌شوند (بدون اینترنت).'),
              _step('۴', 'آن‌ها QR را اسکن می‌کنند یا کد کوتاه را وارد می‌کنند.'),
              _step('۵', 'همه به اتاق وصل می‌شوند و بازی شروع می‌شود!'),
              const SizedBox(height: 16),
              const Text(
                'این روش پایدارترین راه برای بازی آفلاین بین اندروید و آیفون است.',
                style: TextStyle(color: AchaemenidTheme.textSecondary, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await markAsSeen();
              if (ctx.mounted) Navigator.of(ctx).pop();
            },
            child: const Text(
              'متوجه شدم',
              style: TextStyle(color: AchaemenidTheme.gold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _step(String number, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: AchaemenidTheme.gold,
            child: Text(number, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: AchaemenidTheme.textPrimary, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
