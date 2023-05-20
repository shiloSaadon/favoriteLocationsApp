import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:nav_app_4_host/providers/theme_provider.dart';
import 'package:nav_app_4_host/ui/themes/light_theme.dart';
import 'package:provider/provider.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      scaleFactor: .5,
      onPressed: changeTheme,
      child: context.watch<ThemeProvider>().currentTheme == lightTheme
          ? lightThemeIcon
          : darkThemeIcon,
    );
  }

  Widget get lightThemeIcon => const Icon(Icons.light_mode);

  Widget get darkThemeIcon => const Icon(Icons.dark_mode);

  void changeTheme() {
    ThemeProvider().changeTheme();
  }
}
