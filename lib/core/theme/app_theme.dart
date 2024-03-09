import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './styles.dart';

class AppTheme {
  ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Styles.primaryColor,
          background: Styles.backgroundColor,
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.inter().fontFamily,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.inter(
              fontSize: 95, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          displayMedium: GoogleFonts.inter(
              fontSize: 59, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          displaySmall:
              GoogleFonts.inter(fontSize: 48, fontWeight: FontWeight.w400),
          headlineMedium: GoogleFonts.inter(
              fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headlineSmall:
              GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w400),
          titleLarge: GoogleFonts.inter(
              fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0.15),
          titleMedium: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.15),
          titleSmall: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1),
          bodyLarge: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          bodyMedium: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          labelLarge: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          bodySmall: GoogleFonts.inter(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          labelSmall: GoogleFonts.inter(
              fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ).apply(
          displayColor: Colors.white,
          bodyColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Styles.primaryColor,
            foregroundColor: Colors.white,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Styles.backgroundColor,
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Styles.secondaryBackgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(
            color: Styles.mutedForegroundColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          labelStyle: TextStyle(
            color: Styles.secondaryForegroundColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 3,
          ),
          prefixStyle: TextStyle(
            color: Styles.secondaryForegroundColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
}
