import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key, Object? nextPage}) : super(key: key);

  static const route = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Auth'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}