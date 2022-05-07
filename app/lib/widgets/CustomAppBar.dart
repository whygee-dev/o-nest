import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => context.vRouter.historyBack(),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
