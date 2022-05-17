import 'package:flutter/material.dart';

import 'CustomAppBar.dart';

class PrivateScaffold extends StatelessWidget {
  final Widget body;
  final bool useAppbar;
  final Widget? title;
  final bool useBackButton;

  const PrivateScaffold(
      {Key? key,
      required this.body,
      this.useAppbar = false,
      this.title,
      this.useBackButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: useAppbar
          ? CustomAppBar(title: title, useBackButton: useBackButton)
          : null,
    );
  }
}
