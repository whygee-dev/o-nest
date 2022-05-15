import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onest/pages/Home.dart';
import 'package:onest/pages/Login.dart';
import 'package:vrouter/vrouter.dart';

import 'class/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHandler {
  static User? user;
  static bool _didInit = false;

  static init() async {
    if (_didInit) return;

    _didInit = true;

    final prefs = await SharedPreferences.getInstance();

    final stored = prefs.getString("user");

    if (stored != null) {
      AuthHandler.user = User.fromJson(jsonDecode(stored));
    }
  }

  static isUserLoggedIn() {
    return user != null;
  }

  static User? getLoggedUser() {
    return AuthHandler.user;
  }

  static login(BuildContext context, User user) async {
    AuthHandler.user = user;

    final prefs = await SharedPreferences.getInstance();

    print(user.toJson());

    prefs.setString("user", jsonEncode(user.toJson()));

    context.vRouter.to(Home.route);
  }

  static logout(BuildContext context) async {
    AuthHandler.user = null;

    final prefs = await SharedPreferences.getInstance();
    prefs.remove("user");

    context.vRouter.to(Login.route);
  }
}
