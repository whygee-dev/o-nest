import 'package:flutter/material.dart';

class AppColors {
  static const Map<int, Color> primaryColorMap = {
    50: Color.fromRGBO(57, 57, 57, 0.1),
    100: Color.fromRGBO(57, 57, 57, 0.2),
    200: Color.fromRGBO(57, 57, 57, 0.3),
    300: Color.fromRGBO(57, 57, 57, 0.4),
    400: Color.fromRGBO(57, 57, 57, 0.5),
    500: Color.fromRGBO(57, 57, 57, 0.6),
    600: Color.fromRGBO(57, 57, 57, 0.7),
    700: Color.fromRGBO(57, 57, 57, 0.8),
    800: Color.fromRGBO(57, 57, 57, 0.9),
    900: Color.fromRGBO(57, 57, 57, 1),
  };

  static const Map<int, Color> secondaryColorMap = {
    50: Color.fromRGBO(26, 26, 26, 0.1),
    100: Color.fromRGBO(26, 26, 26, 0.2),
    200: Color.fromRGBO(26, 26, 26, 0.3),
    300: Color.fromRGBO(26, 26, 26, 0.4),
    400: Color.fromRGBO(26, 26, 26, 0.5),
    500: Color.fromRGBO(26, 26, 26, 0.6),
    600: Color.fromRGBO(26, 26, 26, 0.7),
    700: Color.fromRGBO(26, 26, 26, 0.8),
    800: Color.fromRGBO(26, 26, 26, 0.9),
    900: Color.fromRGBO(26, 26, 26, 1),
  };

  static const Map<int, Color> orangeColorMap = {
    50: Color.fromRGBO(26, 26, 26, 0.1),
    100: Color.fromRGBO(26, 26, 26, 0.2),
    200: Color.fromRGBO(26, 26, 26, 0.3),
    300: Color.fromRGBO(26, 26, 26, 0.4),
    400: Color.fromRGBO(26, 26, 26, 0.5),
    500: Color.fromRGBO(26, 26, 26, 0.6),
    600: Color.fromRGBO(26, 26, 26, 0.7),
    700: Color.fromRGBO(26, 26, 26, 0.8),
    800: Color.fromRGBO(26, 26, 26, 0.9),
    900: Color.fromRGBO(255, 184, 0, 1),
  };

  static const int _primaryColor = 0xFF393939;
  static const int _secondaryColor = 0x1a1a1a;
  static const int _orangeColor = 0xFFB800;

  static const MaterialColor primaryColor =
      MaterialColor(_primaryColor, primaryColorMap);

  static const MaterialColor secondaryColor =
      MaterialColor(_secondaryColor, secondaryColorMap);

  static const MaterialColor orangeColor =
      MaterialColor(_orangeColor, orangeColorMap);
}
