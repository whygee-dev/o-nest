import 'package:flutter/material.dart';

import '../widgets/CustomAppBar.dart';
import '../widgets/LoginForm.dart';

class Login extends StatelessWidget {
  const Login({Key? key, Object? nextPage}) : super(key: key);

  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/wavy.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Image.asset(
                  "assets/logo.png",
                  width: 250,
                  height: 250,
                ),
              ),
            ),
            const Expanded(
              child: LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}
