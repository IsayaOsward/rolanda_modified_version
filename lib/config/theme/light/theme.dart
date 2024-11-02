import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/config/theme/custom_swatch.dart';
import 'colors.dart';
import 'text_theme.dart';

class LightTheme {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: lightColorScheme.primary,
        textTheme: LightTextTheme.lightTextTheme,
        brightness: Brightness.light,
        primarySwatch: customSwatch,
        scaffoldBackgroundColor: lightColorScheme.surface,
        appBarTheme: AppBarTheme(
          foregroundColor: lightColorScheme.onSurface,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: customSwatch,
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: lightColorScheme.onSurface,
            backgroundColor: customSwatch,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: customSwatch,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: customSwatch,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: customSwatch),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: customSwatch),
          ),
          labelStyle: TextStyle(color: customSwatch),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: customSwatch,
          foregroundColor: lightColorScheme.onSurface,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(
              lightColorScheme.onSurface,
            ),
          ),
        ),
      );
}
