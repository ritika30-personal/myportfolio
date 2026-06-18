import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color bgColor = Color(0xFF0D0D0B);
  static const Color surfaceColor = Color(0xFF161614);
  static const Color cardColor = Color(0xFF1C1C19);
  static const Color borderColor = Color(0xFF2A2A26);
  static const Color accentGreen = Color(0xFFC8F06E);
  static const Color accentTeal = Color(0xFF8BE8C8);
  static const Color textColor = Color(0xFFF2F0E8);
  static const Color mutedColor = Color(0xFF888880);

  // Text Styles
  static const TextStyle serifDisplay = TextStyle(
    fontFamily: 'Georgia',
    color: textColor,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle bodyStyle = TextStyle(
    color: textColor,
    fontSize: 15,
    height: 1.6,
  );

  static const TextStyle mutedStyle = TextStyle(
    color: mutedColor,
    fontSize: 14,
    height: 1.7,
  );

  static const TextStyle labelStyle = TextStyle(
    color: mutedColor,
    fontSize: 11,
    letterSpacing: 1.4,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle accentLabel = TextStyle(
    color: accentGreen,
    fontSize: 11,
    letterSpacing: 1.2,
    fontWeight: FontWeight.w500,
  );

  // Decorations
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: cardColor,
    borderRadius: BorderRadius.circular(14),
    border: Border.all(color: borderColor),
  );

  static BoxDecoration get cardDecorationLg => BoxDecoration(
    color: cardColor,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: borderColor),
  );
}
