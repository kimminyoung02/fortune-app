import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const white = Color(0xFFFFFFFF);
  static const lavender = Color(0xFFBEB5E2);
  static const mint = Color(0xFFD0F6E9);
  static const slate = Color(0xFF6F89A2);
  static const brown = Color(0xFF7D6B67);
}

class AppTheme {
  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.lavender)
          .copyWith(primary: AppColors.slate),
      scaffoldBackgroundColor: AppColors.white,
    );
    return base.copyWith(
      textTheme: GoogleFonts.gowunDodumTextTheme(base.textTheme).apply(
        bodyColor: AppColors.brown,
        displayColor: AppColors.brown,
      ),
    );
  }

  static TextStyle get title => GoogleFonts.gowunBatang(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.brown,
      );
}
