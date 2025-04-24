import 'package:flutter/material.dart';

/// App color constants
class AppColors {
  // Background colors
  static const Color backgroundColor = Color(0xFFE3F7FF);
  static const Color cardBackgroundColor = Color(0xFF7FBBDD);
  static const Color buttonColor = Color(0xFFF58B05);
  static const Color hoverColor = Color(0xFFE6A84A); // Added hover color

  // Text colors
  static const Color welcomeTextColor = Color(0xFFFFC22F);
  static const Color schoolNameColor = Color(0xFFF58B05);
}

/// Extension to provide 'auto' margin functionality similar to CSS
extension EdgeInsetsSymmetricExtension on EdgeInsets {
  static EdgeInsets symmetric({dynamic horizontal = 0, dynamic vertical = 0}) {
    // If 'auto' is specified, return EdgeInsets.zero
    // In Flutter, centering is handled by parent widgets like Center or alignment properties
    final double horizontalValue = horizontal == 'auto' ? 0 : horizontal.toDouble();
    final double verticalValue = vertical == 'auto' ? 0 : vertical.toDouble();

    return EdgeInsets.symmetric(
      horizontal: horizontalValue,
      vertical: verticalValue,
    );
  }
}

/// Constant to represent 'auto' value for margins
const auto = 'auto';