import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key, Object? nextPage}) : super(key: key);

  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}