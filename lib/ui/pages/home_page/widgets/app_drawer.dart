import 'package:flutter/material.dart';
import 'package:nav_app_4_host/providers/auth_provider.dart';
import 'package:nav_app_4_host/ui/general_widgets/custom_widgets/custom_container.dart';

import '../../../../providers/user_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hey, ${UserProvider().user.name}"),
            const SizedBox(height: 20),
            signUpButton(context),
          ],
        ),
      ),
    );
  }

  Widget signUpButton(BuildContext context) {
    return CustomContainer(
      onTap: () {
        AuthProvider().signOut(context);
      },
      raduis: 8,
      userRegulatBorder: true,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: const Text("Sign out"),
    );
  }
}
