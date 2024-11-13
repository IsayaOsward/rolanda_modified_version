import 'package:flutter/material.dart';

const int _primaryColorValue = 0xFF5177FF;

const MaterialColor customSwatch = MaterialColor(
  _primaryColorValue,
  <int, Color>{
    50: Color(0xFFE3EBFF),  
    100: Color(0xFFB9CCFF),
    200: Color(0xFF8EABFF),
    300: Color(0xFF628AFF),
    400: Color(0xFF5177FF), 
    500: Color(_primaryColorValue),
    600: Color(0xFF4664E5),
    700: Color(0xFF3A52CC),
    800: Color(0xFF2E42B2),
    900: Color(0xFF223299),
  },
);
