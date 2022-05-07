import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import '../HexColor.dart';

Widget customTextField(
    BuildContext context, IconData icon, String hint, Function validate,
    {double? width,
    double paddingVertical = 0.0,
    double paddingHorizontal = 0.0}) {
  var window = MediaQuery.of(context).size;

  return SizedBox(
    width: width ?? window.width / 1.15,
    child: Padding(
      padding: EdgeInsets.symmetric(
          vertical: paddingVertical, horizontal: paddingHorizontal),
      child: TextFormField(
        textDirection: TextDirection.ltr,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(color: Colors.white, fontSize: 17),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.white),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: HexColor("#E5E5E5"),
          ),
          prefixIcon: Icon(icon, color: Colors.white),
          isCollapsed: true,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Ce champs est requis';
          }

          return validate(value);
        },
      ),
    ),
  );
}
