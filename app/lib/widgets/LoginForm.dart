import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onest/utils/Validators.dart';

import '../AppColors.dart';
import '../HexColor.dart';
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
            (String value) {
              if (!value.isValidEmail()) {
                return 'Email invalide';
              }

              return null;
            },
          ),
          customTextField(context, Icons.lock, "Mot de passe", (value) {
            if (value.length < 8) {
              return 'Minimum 8 caractères';
            }

            return null;
          }, paddingVertical: 30),
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Connexion...')),
                  );
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
