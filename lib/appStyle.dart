import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle appBarTitleStyle = TextStyle(
    fontSize: 24,
    color: Colors.white,
  );

  static TextStyle labelTextStyle() {
    return TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
  }

  static Color get textFieldFillColor => Colors.white.withOpacity(0.7);

  static Color get buttonColor => Colors.green;
}
