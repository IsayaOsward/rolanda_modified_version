import 'package:flutter/material.dart';

class ScreenSizeHelper {
  // Method to get screen width
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Method to get screen height
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
