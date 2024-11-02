import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/config/theme/custom_swatch.dart';
import 'colors.dart';
import 'text_theme.dart';

class DarkTheme {
  static ThemeData get darkTheme => ThemeData(
        primaryColor: darkColorScheme.primary,
        textTheme: DarkTextTheme.darkTextTheme,
        brightness: Brightness.dark,
        primarySwatch: customSwatch,
        scaffoldBackgroundColor: darkColorScheme.surface,
        appBarTheme: AppBarTheme(
          foregroundColor: darkColorScheme.onSurface,
          backgroundColor: darkColorScheme.surface,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: customSwatch,
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: darkColorScheme.onSurface,
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
          foregroundColor: darkColorScheme.onSurface,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStateProperty.all(
              darkColorScheme.onSurface,
            ),
          ),
        ),
      );
}
