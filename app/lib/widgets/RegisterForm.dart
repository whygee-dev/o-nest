import 'package:flutter/material.dart';
import 'package:onest/utils/Validators.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: new InputDecoration.collapsed(hintText: 'Username'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ce champs est requis';
              }

              if (!value.isValidEmail()) {
                return 'Email invalide';
              }

              return null;
            },
          ),
          TextFormField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ce champs est requis';
              }

              if (value.length < 8) {
                return 'Minimum 8 caractères';
              }

              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Création de votre compte...')),
                );
              }
            },
            child: const Text('S\inscrire'),
          ),
        ],
      ),
    );
  }
}
