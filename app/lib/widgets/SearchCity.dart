import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onest/utils/Validators.dart';

import '../AppColors.dart';
import 'CustomTextField.dart';

class SearchCity extends StatefulWidget {
  final Function onSearch;

  const SearchCity({Key? key, required this.onSearch}) : super(key: key);

  @override
  SearchCityFormState createState() {
    return SearchCityFormState(onSearch: onSearch);
  }
}

class SearchCityFormState extends State<SearchCity> {
  final _formKey = GlobalKey<FormState>();
  final Function onSearch;
  Timer? searchOnStoppedTyping;

  static var loginTextStyle = TextStyle(
    fontSize: 20,
    color: AppColors.primaryColor,
  );

  SearchCityFormState({required this.onSearch});

  Future login(String email, String password) async {}

  TextEditingController cityController = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var window = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          customTextField(context, Icons.location_on, "Chercher par ville",
              cityController, (String value) {}, paddingVertical: 20,
              onChanged: (String value) {
            const duration = Duration(
              milliseconds: 800,
            ); // set the duration that you want call search() after that.

            if (searchOnStoppedTyping != null) {
              setState(() => searchOnStoppedTyping!.cancel()); // clear timer
            }

            setState(() => searchOnStoppedTyping =
                new Timer(duration, () => onSearch(value)));

            return null;
          }),
        ],
      ),
    );
  }
}
