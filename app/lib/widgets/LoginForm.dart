import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onest/AuthHandler.dart';
import 'package:onest/utils/Validators.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../AppColors.dart';
import '../HexColor.dart';
import '../class/User.dart';
import 'CustomSnackBar.dart';
import 'CustomTextField.dart';

// Define a custom Form widget.
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  static var loginTextStyle = TextStyle(
    fontSize: 20,
    color: AppColors.primaryColor,
  );

  Future login(String email, String password) async {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context)
        .showSnackBar(customSnackBar(message: "Connexion..."));

    final req = await http.post(Uri.parse(dotenv.env['API']! + "/login"),
        body: {"email": email, "password": password});

    if (req.statusCode == 201) {
      await Future.delayed(const Duration(milliseconds: 500),
          () => ScaffoldMessenger.of(context).clearSnackBars());

      final user = User.fromJson(jsonDecode(req.body));
      AuthHandler.login(context, user);

      return user;
    } else if (req.statusCode == 401) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(customSnackBar(message: "Identifiants incorrectes"));
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(message: "Une erreur serveur est survenue"));
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var window = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          customTextField(
            context,
            Icons.email,
            "Email",
            emailController,
            (String value) {
              if (!value.isValidEmail()) {
                return 'Email invalide';
              }

              return null;
            },
          ),
          customTextField(
            context,
            Icons.lock,
            "Mot de passe",
            passwordController,
            (value) {
              if (value.length < 8) {
                return 'Minimum 8 caractères';
              }

              return null;
            },
            paddingVertical: 30,
            obscureText: true,
          ),
          SizedBox(
            width: window.width / 1.15,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.white,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0),
                    side: const BorderSide(color: Colors.white54),
                  ),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  login(emailController.text, passwordController.text);
                }
              },
              child: Text(
                'Se connecter',
                style: GoogleFonts.balsamiqSans(
                  textStyle: loginTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
