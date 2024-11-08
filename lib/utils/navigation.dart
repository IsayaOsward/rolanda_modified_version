import 'package:flutter/material.dart';
void pushNamed(BuildContext context, pageName)
{
  Navigator.pushNamed(context, pageName);
}

void pushReplacement(BuildContext context, pageName) {
  Navigator.pushReplacementNamed(context, pageName);
}
void navPop(BuildContext context) {
  Navigator.pop(context);
}
