// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// const MaterialColor customSwatch = MaterialColor(
//   0xff006f8b, // Base color
//   <int, Color>{
//     50: Color(0xFFE0F7FA),
//     100: Color(0xFFB2EBF2),
//     200: Color(0xFF80DEEA),
//     300: Color(0xFF4DD0E1),
//     400: Color(0xFF26C6DA),
//     500: Color(0xFF00BCD4),
//     600: Color(0xFF00ACC1),
//     700: Color(0xff006f8b),
//     800: Color(0xFF00838F),
//     900: Color(0xFF006064),
//   },
// );
// final ThemeData lightTheme = ThemeData(
//   pageTransitionsTheme: const PageTransitionsTheme(
//     builders: {
//       TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//       TargetPlatform.android: CupertinoPageTransitionsBuilder()
//     },
//   ),
//   colorScheme: lightColorScheme,
//   textTheme: GoogleFonts.poppinsTextTheme(
//     const TextTheme(
//       displayLarge: TextStyle(
//           fontSize: 96.0,
//           color: Colors.black,
//           fontWeight: FontWeight.w300,
//           letterSpacing: -1.5), // light
//       displayMedium: TextStyle(
//           fontSize: 60.0,
//           color: Colors.black,
//           fontWeight: FontWeight.w300,
//           letterSpacing: -0.5), // light
//       displaySmall: TextStyle(
//           fontSize: 48.0,
//           color: Colors.black,
//           fontWeight: FontWeight.w400), // regular
//       headlineMedium: TextStyle(
//           fontSize: 34.0,
//           color: Colors.black,
//           fontWeight: FontWeight.w400,
//           letterSpacing: 0.25), // regular
//       headlineSmall: TextStyle(
//           fontSize: 24.0,
//           color: Colors.black,
//           fontWeight: FontWeight.w400), // regular
//       titleLarge: TextStyle(
//           fontSize: 20.0,
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//           letterSpacing: 0.15), // medium
//       titleMedium: TextStyle(
//           fontSize: 16.0,
//           color: Colors.black,
//           fontWeight: FontWeight.w400,
//           letterSpacing: 0.15), // regular
//       titleSmall: TextStyle(
//           fontSize: 14.0,
//           color: Colors.black,
//           fontWeight: FontWeight.w500,
//           letterSpacing: 0.1), // medium
//       bodyLarge: TextStyle(
//           fontSize: 16.0,
//           color: Colors.black,
//           fontWeight: FontWeight.w400,
//           letterSpacing: 0.5), // regular
//       bodyMedium: TextStyle(
//           fontSize: 16.0,
//           color: Colors.black,
//           fontWeight: FontWeight.w400,
//           letterSpacing: 0.25), // regular
//       bodySmall: TextStyle(
//           fontSize: 12.0,
//           color: Colors.black,
//           fontWeight: FontWeight.w400,
//           letterSpacing: 0.4), // regular
//       labelLarge: TextStyle(
//           fontSize: 14.0,
//           color: Colors.black,
//           fontWeight: FontWeight.w500,
//           letterSpacing: 1.25), // medium
//       labelSmall: TextStyle(
//           fontSize: 10.0,
//           color: Colors.black,
//           fontWeight: FontWeight.w400,
//           letterSpacing: 1.5), // regular
//     ),
//   ),
//   brightness: Brightness.light,
//   primarySwatch: customSwatch,
//   scaffoldBackgroundColor: Colors.white,
//   appBarTheme: const AppBarTheme(
//     foregroundColor: Colors.white, // AppBar text color
//   ),
//   buttonTheme: const ButtonThemeData(
//     buttonColor: customSwatch, // RaisedButton background color
//     textTheme: ButtonTextTheme.primary, // RaisedButton text color
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       foregroundColor: Colors.white,
//       backgroundColor: customSwatch, // ElevatedButton text color
//     ),
//   ),
//   outlinedButtonTheme: OutlinedButtonThemeData(
//     style: OutlinedButton.styleFrom(
//       foregroundColor: customSwatch, // OutlinedButton text and border color
//     ),
//   ),
//   textButtonTheme: TextButtonThemeData(
//     style: TextButton.styleFrom(
//       foregroundColor: customSwatch, // TextButton text color
//     ),
//   ),
//   inputDecorationTheme: const InputDecorationTheme(
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//           color: customSwatch), // TextField border color when focused
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//           color: customSwatch), // TextField border color when enabled
//     ),
//     labelStyle: TextStyle(color: customSwatch), // Label color
//   ),
//   floatingActionButtonTheme: const FloatingActionButtonThemeData(
//     backgroundColor: customSwatch,
//     foregroundColor: Colors.white,
//   ),
//   iconButtonTheme: const IconButtonThemeData(
//       style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.black))),
// );

// final ThemeData darkTheme = ThemeData(
//   pageTransitionsTheme: const PageTransitionsTheme(
//     builders: {
//       TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//       TargetPlatform.android: CupertinoPageTransitionsBuilder()
//     },
//   ),
//   brightness: Brightness.dark,
//   colorScheme: darkColorScheme,
//   textTheme: GoogleFonts.poppinsTextTheme(
//     const TextTheme(
//       displayLarge: TextStyle(
//           fontSize: 96.0,
//           color: Colors.white,
//           fontWeight: FontWeight.w300,
//           letterSpacing: -1.5), // light
//       displayMedium: TextStyle(
//           fontSize: 60.0,
//           color: Colors.white,
//           fontWeight: FontWeight.w300,
//           letterSpacing: -0.5), // light
//       displaySmall: TextStyle(
//           fontSize: 48.0,
//           color: Colors.white,
//           fontWeight: FontWeight.w400), // regular
//       headlineMedium: TextStyle(
//           fontSize: 34.0,
//           color: Colors.white,
//           fontWeight: FontWeight.w400,
//           letterSpacing: 0.25), // regular
//       headlineSmall: TextStyle(
//           fontSize: 24.0,
//           color: Colors.white,
//           fontWeight: FontWeight.w400), // regular
//       titleLarge: TextStyle(
//           fontSize: 20.0,
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//           letterSpacing: 0.15), // medium
//       titleMedium: TextStyle(
//           fontSize: 16.0,
//           color: Colors.white,
//           fontWeight: FontWeight.w400,
//           letterSpacing: 0.15), // regular
//       titleSmall: TextStyle(
//           fontSize: 14.0,
//           color: Colors.white,
//           fontWeight: FontWeight.w500,
//           letterSpacing: 0.1), // medium
//       bodyLarge: TextStyle(
//           fontSize: 16.0,
//           color: Colors.white,
//           fontWeight: FontWeight.w400,
//           letterSpacing: 0.5), // regular
//       bodyMedium: TextStyle(
//           fontSize: 16.0,
//           color: Colors.white,
//           fontWeight: FontWeight.w400,
//           letterSpacing: 0.25), // regular
//       bodySmall: TextStyle(
//           fontSize: 12.0,
//           color: Colors.white,
//           fontWeight: FontWeight.w400,
//           letterSpacing: 0.4), // regular
//       labelLarge: TextStyle(
//           fontSize: 14.0,
//           color: Colors.white,
//           fontWeight: FontWeight.w500,
//           letterSpacing: 1.25), // medium
//       labelSmall: TextStyle(
//           fontSize: 10.0,
//           color: Colors.white,
//           fontWeight: FontWeight.w400,
//           letterSpacing: 1.5), // regular
//     ),
//   ),
//   primarySwatch: customSwatch,
//   scaffoldBackgroundColor: Colors.black,
//   appBarTheme: const AppBarTheme(
//     foregroundColor: Colors.white,
//   ),
//   buttonTheme: const ButtonThemeData(
//     buttonColor: customSwatch,
//     textTheme: ButtonTextTheme.primary,
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       foregroundColor: Colors.white,
//       backgroundColor: customSwatch,
//     ),
//   ),
//   outlinedButtonTheme: OutlinedButtonThemeData(
//     style: OutlinedButton.styleFrom(
//       foregroundColor: customSwatch,
//     ),
//   ),
//   textButtonTheme: TextButtonThemeData(
//     style: TextButton.styleFrom(
//       foregroundColor: customSwatch,
//     ),
//   ),
//   inputDecorationTheme: const InputDecorationTheme(
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: customSwatch),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: customSwatch),
//     ),
//     labelStyle: TextStyle(color: customSwatch),
//   ),
//   floatingActionButtonTheme: const FloatingActionButtonThemeData(
//     backgroundColor: customSwatch,
//     foregroundColor: Colors.white,
//   ),
//   iconButtonTheme: const IconButtonThemeData(
//       style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white))),
// );

// final ColorScheme lightColorScheme = ColorScheme.fromSwatch(
//   primarySwatch: customSwatch,
//   brightness: Brightness.light,
// ).copyWith(
//   primary: const Color(0xFF256489),
//   onPrimary: const Color(0xFFffffff),
//   primaryContainer: const Color(0xffc9e6ff),
//   onPrimaryContainer: const Color(0xff001e2f),
//   secondary: const Color(0xFF4F606E),
//   onSecondary: const Color(0xFFffffff),
//   secondaryContainer: const Color(0xffd3e5f5),
//   onSecondaryContainer: const Color(0xff0b1d29),
//   tertiary: const Color(0xFF64597c),
//   onTertiary: const Color(0xFFffffff),
//   tertiaryContainer: const Color(0xffeaddff),
//   onTertiaryContainer: const Color(0xff1f1635),
//   error: const Color(0xffba1a1a),
//   onError: const Color(0xffffffff),
//   errorContainer: const Color(0xffffdad6),
//   onErrorContainer: const Color(0xff410002),
//   surfaceDim: const Color(0xffd7dadf),
//   surface: const Color(0xfff6f9fe),
//   surfaceBright: const Color(0xfff6f9fe),
//   inverseSurface: const Color(0xff2d3135),
//   surfaceContainerLowest: const Color(0xffffffff),
//   surfaceContainerLow: const Color(0xfff1f4f9),
//   surfaceContainer: const Color(0xffebeef3),
//   surfaceContainerHigh: const Color(0xffe5e8ed),
//   surfaceContainerHighest: const Color(0xffdfe3e8),
//   inversePrimary: const Color(0xff94cdf7),
//   onSurface: const Color(0xff181c20),
//   onSurfaceVariant: const Color(0xff41474d),
//   outline: const Color(0xff71787e),
//   outlineVariant: const Color(0xffc1c7ce),
//   scrim: const Color(0xff000000),
//   shadow: const Color(0xff000000)
// );

// final ColorScheme darkColorScheme = ColorScheme.fromSwatch(
//   primarySwatch: customSwatch,
//   brightness: Brightness.dark,
// ).copyWith(
//   primary: const Color(0xFF94cdf7),
//   onPrimary: const Color(0xFF00344d), 
//   primaryContainer: const Color(0xFF004c6e),
//   onPrimaryContainer: const Color(0xffc9e6ff),
//   secondary: const Color(0xffb7c9d9),
//   onSecondary: const Color(0xff21323f),
//   secondaryContainer: const Color(0xff384956),
//   onSecondaryContainer: const Color(0xffd3e5f5),
//   tertiary: const Color(0xffcec0e8),
//   onTertiary: const Color(0xff352b4b),
//   tertiaryContainer: const Color(0xff4c4163),
//   onTertiaryContainer: const Color(0xffeaddff),
//   error: const Color(0xFFffb4ab),
//   onError: const Color(0xff690005),
//   errorContainer: const Color(0xff93000a),
//   onErrorContainer: const Color(0xffffdad6),
//   surfaceDim: const Color(0xff101417),
//   surface: const Color(0xff101417),
//   surfaceBright: const Color(0xff353a3e),
//   inverseSurface: const Color(0xffdfe3e8),
//   surfaceContainerLowest: const Color(0xff0a0f12),
//   surfaceContainerLow: const Color(0xff181c20),
//   surfaceContainer: const Color(0xff1c2024),
//   surfaceContainerHigh: const Color(0xff262a2e),
//   surfaceContainerHighest: const Color(0xff313539),
//   inversePrimary: const Color(0xff256489),
//   onSurface: const Color(0xffdfe3e8),
//   onSurfaceVariant: const Color(0xffc1c7ce),
//   outline: const Color(0xff8b9198),
//   outlineVariant: const Color(0xff42474d),
//   scrim: const Color(0xff000000),
//   shadow: const Color(0xff000000)
// );

