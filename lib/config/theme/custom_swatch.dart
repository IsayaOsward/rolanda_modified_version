import 'package:flutter/material.dart';

// Define a custom color swatch based on your primary color (e.g., 0xFF256489).
const int _primaryColorValue = 0xFF256489;

const MaterialColor customSwatch = MaterialColor(
  _primaryColorValue,
  <int, Color>{
    50: Color(0xFFE3F2FD),  // Lightest shade
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(_primaryColorValue),  // Base color
    600: Color(0xFF1E4E6F),
    700: Color(0xFF194361),
    800: Color(0xFF143853),
    900: Color(0xFF0E2C45),  // Darkest shade
  },
);
