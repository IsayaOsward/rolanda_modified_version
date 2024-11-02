import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rolanda_modified_version/config/theme/dark/colors.dart';

class DarkTextTheme {
  static TextTheme get darkTextTheme => GoogleFonts.montserratTextTheme(
        TextTheme(
          displayLarge: TextStyle(
            fontSize: 96.0,
            color: darkColorScheme.onPrimary,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
          ),
          displayMedium: TextStyle(
            fontSize: 60.0,
            color: darkColorScheme.onPrimary,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
          ),
          displaySmall: TextStyle(
            fontSize: 48.0,
            color: darkColorScheme.onSurface,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: TextStyle(
            fontSize: 34.0,
            color: darkColorScheme.onSurface,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          headlineSmall: TextStyle(
            fontSize: 24.0,
            color: darkColorScheme.onSurface,
            fontWeight: FontWeight.w400,
          ),
          titleLarge: TextStyle(
            fontSize: 20.0,
            color: darkColorScheme.primary,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.15,
          ),
          titleMedium: TextStyle(
            fontSize: 16.0,
            color: darkColorScheme.onSecondary,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
          ),
          titleSmall: TextStyle(
            fontSize: 14.0,
            color: darkColorScheme.onPrimaryContainer,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
          bodyLarge: TextStyle(
            fontSize: 16.0,
            color: darkColorScheme.onSurface,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
          bodyMedium: TextStyle(
            fontSize: 16.0,
            color: darkColorScheme.onSurface,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          bodySmall: TextStyle(
            fontSize: 12.0,
            color: darkColorScheme.onSurface,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
          ),
          labelLarge: TextStyle(
            fontSize: 14.0,
            color: darkColorScheme.onSecondaryContainer,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
          ),
          labelSmall: TextStyle(
            fontSize: 10.0,
            color: darkColorScheme.onSurface,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
          ),
        ),
      );
}
