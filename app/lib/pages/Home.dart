import 'package:flutter/material.dart';

import '../AuthHandler.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const route = '/home';

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('User ' + AuthHandler.getLoggedUser()!.email),
            ElevatedButton(
                child: Text("Logout"),
                onPressed: () => AuthHandler.logout(context))
          ],
        ),
      ),
    );
  }
}
