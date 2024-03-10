import 'package:flutter/material.dart';

// MyCustomButtonStyle, contains two static methods customStyle and customStyle2.
// Each method returns a ButtonStyle object configured for use with ElevatedButton widgets.
// These styles customize buttons with specific colors, sizes, padding, and shapes.

class MyCustomButtonStyle {
  static ButtonStyle get customStyle {
    return ElevatedButton.styleFrom(
      onPrimary: Color(0xffE85227),
      // Text color
      primary: Colors.white,
      // Background color
      minimumSize: Size(100, 36),
      // Minimum size
      padding: EdgeInsets.symmetric(horizontal: 16),
      // Inner padding
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: Color(0xffE85227)), // Rounded corners
      ),
    );
  }

  static ButtonStyle get customStyle2 {
    return ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      // Text color
      primary: Color(0xff4EBBB4),
      // Background color
      minimumSize: Size(100, 36),
      // Minimum size
      padding: EdgeInsets.symmetric(horizontal: 16),
      // Inner padding
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: Color(0xff4EBBB4)), // Rounded corners
      ),
    );
  }
}
