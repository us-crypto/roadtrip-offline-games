import 'package:flutter/material.dart';

/// Achaemenid Empire inspired high-contrast dark theme
/// Optimized for car / road-trip readability.
class AchaemenidTheme {
  // Colors
  static const Color background = Color(0xFF1A1A1A);
  static const Color surface = Color(0xFF2A2A2A);
  static const Color gold = Color(0xFFD4AF37);
  static const Color lapis = Color(0xFF1E3A5F);
  static const Color turquoise = Color(0xFF2A9D8F);
  static const Color cinnabar = Color(0xFFC73E1D);
  static const Color textPrimary = Color(0xFFF5F5F5);
  static const Color textSecondary = Color(0xFFB0B0B0);

  static ThemeData get dark {
    final base = ThemeData.dark(useMaterial3: true);

    return base.copyWith(
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.dark(
        primary: gold,
        secondary: turquoise,
        surface: surface,
        error: cinnabar,
        onPrimary: background,
        onSecondary: textPrimary,
        onSurface: textPrimary,
        onError: textPrimary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        foregroundColor: gold,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: gold,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: gold,
          foregroundColor: background,
          minimumSize: const Size(double.infinity, 56),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: gold,
          side: const BorderSide(color: gold, width: 2),
          minimumSize: const Size(double.infinity, 56),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: gold, width: 1),
        ),
      ),
      textTheme: base.textTheme.apply(
        bodyColor: textPrimary,
        displayColor: textPrimary,
      ).copyWith(
        titleLarge: const TextStyle(
          color: gold,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: const TextStyle(
          color: textPrimary,
          fontSize: 18,
        ),
        bodyMedium: const TextStyle(
          color: textSecondary,
          fontSize: 16,
        ),
      ),
    );
  }
}
