import 'package:flutter/material.dart';

class AppColors {
  static Map<int, Color> primaryColorMap = {
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

static int _primaryColor = 0xFF393939;

static MaterialColor primaryColor = MaterialColor(_primaryColor, primaryColorMap);
}