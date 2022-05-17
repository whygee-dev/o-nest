import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  final Widget? title;
  final Color? backgroundColor;
  final bool useBackButton;

  const CustomAppBar(
      {Key? key, this.title, this.backgroundColor, this.useBackButton = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: useBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.vRouter.historyBack(),
            )
          : null,
      elevation: 0,
      backgroundColor: backgroundColor ?? Colors.transparent,
      title: title,
      toolbarHeight: 80,
      centerTitle: title != null,
    );
  }
}
