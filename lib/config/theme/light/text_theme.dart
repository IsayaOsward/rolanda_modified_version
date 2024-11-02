import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rolanda_modified_version/config/theme/light/colors.dart';

class LightTextTheme {
  static TextTheme get lightTextTheme => GoogleFonts.montserratTextTheme(
        TextTheme(
          displayLarge: TextStyle(
              fontSize: 96.0,
              color: lightColorScheme.onSurface,
              fontWeight: FontWeight.w300,
              letterSpacing: -1.5), // light
          displayMedium: TextStyle(
              fontSize: 60.0,
              color: lightColorScheme.onSurface,
              fontWeight: FontWeight.w300,
              letterSpacing: -0.5), // light
          displaySmall: TextStyle(
              fontSize: 48.0,
              color: lightColorScheme.onSurface,
              fontWeight: FontWeight.w400), // regular
          headlineMedium: TextStyle(
              fontSize: 34.0,
              color: lightColorScheme.onSurface,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25), // regular
          headlineSmall: TextStyle(
              fontSize: 24.0,
              color: lightColorScheme.primary,
              fontWeight: FontWeight.w400), // regular
          titleLarge: TextStyle(
              fontSize: 20.0,
              color: lightColorScheme.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.15), // medium
          titleMedium: TextStyle(
              fontSize: 16.0,
              color: lightColorScheme.onPrimary,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.15), // regular
          titleSmall: TextStyle(
              fontSize: 14.0,
              color: lightColorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.1), // medium
          bodyLarge: TextStyle(
              fontSize: 16.0,
              color: lightColorScheme.onSurface,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5), // regular
          bodyMedium: TextStyle(
              fontSize: 16.0,
              color: lightColorScheme.onSurface,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25), // regular
          bodySmall: TextStyle(
              fontSize: 12.0,
              color: lightColorScheme.onSurface,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.4), // regular
          labelLarge: TextStyle(
              fontSize: 14.0,
              color: lightColorScheme.primaryContainer,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.25), // medium
          labelSmall: TextStyle(
              fontSize: 10.0,
              color: lightColorScheme.onPrimary,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.5), // regular
        ),
      );
}
