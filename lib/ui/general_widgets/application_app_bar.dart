import 'package:flutter/material.dart';

import 'change_theme_button.dart';

class ApplicationAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool allowLeading;
  const ApplicationAppBar({super.key, this.allowLeading = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("My map"),
      leading: allowLeading ? null : const SizedBox(width: 1),
      actions: const [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ChangeThemeButton())
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
