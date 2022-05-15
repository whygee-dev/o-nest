import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onest/utils/Validators.dart';
import 'package:http/http.dart' as http;

import '../AppColors.dart';
import '../AuthHandler.dart';
import '../class/User.dart';
import 'CustomSnackBar.dart';
import 'CustomTextField.dart';

// Define a custom Form widget.
class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  static var registerTextStyle = TextStyle(
    fontSize: 20,
    color: AppColors.primaryColor,
  );

  Future register(String email, String password) async {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context)
        .showSnackBar(customSnackBar(message: "Création de votre compte..."));

    final req = await http.post(Uri.parse(dotenv.env['API']! + "/register"),
        body: {"email": email, "password": password});

    final body = jsonDecode(req.body);

    if (req.statusCode == 201) {
      await Future.delayed(const Duration(milliseconds: 500),
          () => ScaffoldMessenger.of(context).clearSnackBars());

      final user = User.fromJson(body);
      AuthHandler.login(context, user);

      return user;
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
          message: body["message"] ?? "Une erreur serveur est survenue"));
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
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
                  register(emailController.text, passwordController.text);
                }
              },
              child: Text(
                'S\'inscrire',
                style: GoogleFonts.balsamiqSans(
                  textStyle: registerTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
