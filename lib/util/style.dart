import 'package:flutter/material.dart';

abstract class ThemeText {
  static const TextStyle header = TextStyle(
      fontFamily: 'Inter',
      color: Colors.white,
      fontSize: 32,
      height: 1.25,
      fontWeight: FontWeight.w700);

  static const TextStyle code = TextStyle(
      fontFamily: 'Inter',
      color: ThemeColor.textColor,
      fontSize: 16,
      height: 1.25,
      fontWeight: FontWeight.w500);

  static const TextStyle countryName = TextStyle(
      fontFamily: 'Inter',
      color: Colors.white,
      fontSize: 16,
      height: 1.25,
      fontWeight: FontWeight.w500);

  static const TextStyle hint = TextStyle(
      fontFamily: 'Inter',
      color: ThemeColor.hintColor,
      fontSize: 16,
      height: 1.25,
      fontWeight: FontWeight.w500);
}

abstract class ThemeColor {
  static const Color background = Color(0xFF8EAAFB);

  static const Color boxBackground = Color(0x66F4F5FF);

  static const Color textColor = Color(0xFF594C74);

  static const Color hintColor = Color(0xFF7886B8);

  static const Color buttonShadow = Color(0x2626007A);
}
