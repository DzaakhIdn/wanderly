import 'package:flutter/material.dart';

class AppColors {
  final Color background;
  final Color surface;
  final Color textPrimary;
  final Color textSecondary;
  final Color primary;
  final Color secondary;
  final Color divider;
  final Color shadow;
  final Color onPrimary;
  final Color success;
  final Color error;

  const AppColors({
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.primary,
    required this.secondary,
    required this.shadow,
    required this.divider,
    required this.success,
    required this.error,
    required this.onPrimary,
  });

  static AppColors of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? dark : light;
  }

  static const light = AppColors(
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFF8F8F8),
    textPrimary: Color(0xFF242424),
    textSecondary: Color(0xFFFAFAFA),
    primary: Color(0xFF2F4BB9),
    secondary: Color(0xFFFAB95B),
    divider: Color(0xFF333333),
    shadow: Color(0x1A000000),
    onPrimary: Colors.white,
    success: Color(0xFF16A34A),
    error: Color(0xFFDC2626),
  );

  static const dark = AppColors(
    background: Color(0xFF121417),
    surface: Color(0xFF1C1F24),
    textPrimary: Color(0xFFE6E6E6),
    textSecondary: Color(0xFF9CA3AF),
    primary: Color(0xFF8FA8FF),
    secondary: Color(0xFF3E4A74),
    divider: Color(0xFF2A2E35),
    shadow: Color(0x33000000),
    onPrimary: Colors.black,
    success: Color(0xFF22C55E),
    error: Color(0xFFF87171),
  );
}
