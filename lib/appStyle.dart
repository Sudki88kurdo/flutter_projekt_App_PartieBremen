import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle appBarTitleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle commonTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle labelTextStyle() {
    return const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );
  }

  static InputDecoration textFieldDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.green, fontSize: 24),
      filled: true,
      fillColor: Colors.white,
      floatingLabelBehavior: FloatingLabelBehavior.never, // Keep the label below the line
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(color: Colors.green),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(color: Colors.green),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(color: Colors.green),
      ),
      prefixIcon: Icon(icon, color: Colors.green),
    );
  }

  static ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppStyles.buttonColor,
      padding: const EdgeInsets.symmetric(vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }

  static double get buttonWidth => 400;

  static Color get textFieldFillColor => Colors.white.withOpacity(0.7);

  static Color get buttonColor => Color.fromRGBO(1, 98, 71, 1.0);
}
