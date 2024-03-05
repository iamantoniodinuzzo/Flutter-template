import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart' show Color;

@immutable
class CustomColors {
  const CustomColors._();

  static const white = Color.fromARGB(255, 255, 255, 255);
  static const transparent = Color.fromARGB(0, 255, 255, 255);
  static const blue = Color(0xFF0045CC);
  static const grey = Color.fromARGB(255, 158, 158, 158);
  static const lightGrey = Color.fromARGB(255, 239, 239, 239);
  static const lightBlue = Color(0xFF11B2A3);
  static const darkGrey = Color.fromARGB(255, 89, 118, 138);
  static const azure = Color.fromARGB(255, 178, 211, 248);
  static const darkBlue = Color(0xFF1A2C4B);
  static const darkAzure = Color.fromARGB(255, 102, 186, 232);
  static const electricBlue = Color.fromARGB(255, 50, 94, 209);
  static const black = Color.fromARGB(255, 0, 0, 0);
  static const red = Color(0xFFE90E0E);
  static const green = Color(0xFF34C759);
  static const darkGreen = Color(0xFF1DB042);
  static const deepGrey = Color.fromARGB(255, 110, 110, 110);
  static const deepBlue = Color.fromARGB(255, 22, 60, 112);
  static const orange = Color.fromARGB(255, 255, 138, 0);
  static const yellow = Color(0xFFFFC500);
  static const disableGray = Color.fromARGB(255, 220, 220, 220);
  static const disableDarkGray = Color.fromARGB(255, 150, 150, 150);
}
