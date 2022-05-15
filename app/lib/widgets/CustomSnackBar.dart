import 'package:flutter/material.dart';

SnackBar customSnackBar({
  String message = "",
  Duration duration = const Duration(days: 1),
}) {
  return SnackBar(
    content: Text(message),
    duration: duration,
  );
}
