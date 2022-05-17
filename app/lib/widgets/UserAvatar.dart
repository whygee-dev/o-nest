import 'package:flutter/material.dart';

import '../utils/Formatters.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, this.name}) : super(key: key);

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.white,
        child: Text(
          name != null ? Formatters.getInitials(name) : "Anonyme",
        ),
      ),
    );
  }
}
