import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key, Object? nextPage}) : super(key: key);

  static const route = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Register'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}