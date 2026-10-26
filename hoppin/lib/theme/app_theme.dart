import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const bg = Color(0xFFF7F8F5);
  static const ink = Color(0xFF1B1F1D);
  static const inkSoft = Color(0xFF5B645E);
  static const primary = Color(0xFF0F5257);
  static const primaryDark = Color(0xFF0B3D40);
  static const accent = Color(0xFFE8A33D);
  static const accentDark = Color(0xFFC9822A);
  static const surface = Color(0xFFFFFFFF);
  static const border = Color(0xFFE4E7E1);
  static const success = Color(0xFF2F855A);
  static const danger = Color(0xFFC24444);
}

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surface,
      ),
      fontFamily: GoogleFonts.inter().fontFamily,
      textTheme: TextTheme(
        headlineMedium: GoogleFonts.fraunces(fontWeight: FontWeight.w600, fontSize: 22, color: AppColors.ink),
        titleLarge: GoogleFonts.fraunces(fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.ink),
        bodyMedium: GoogleFonts.inter(fontSize: 13.5, color: AppColors.ink),
        bodySmall: GoogleFonts.inter(fontSize: 11.5, color: AppColors.inkSoft),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bg,
        elevation: 0,
        titleTextStyle: GoogleFonts.fraunces(fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.ink),
        iconTheme: const IconThemeData(color: AppColors.ink),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 14.5),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.border)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.border)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.primary, width: 1.5)),
      ),
    );
  }
}
