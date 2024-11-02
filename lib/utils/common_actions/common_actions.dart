import 'package:flutter/material.dart';

class CommonActions {
  static void shiftPage(context, newPage, {bool? kill}) {
    if (kill == true) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => newPage),
        (Route<dynamic> route) => false, // Removes all previous routes
      );
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => newPage));
    }
  }

  static void showSnackbar(BuildContext context, String message,
      {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 6.0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
        content: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )));
  }
}
