import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';

import '../../general_widgets/application_app_bar.dart';

class SignIn extends StatelessWidget {
  final List<AuthProvider<AuthListener, AuthCredential>>? providers = [
    EmailAuthProvider(),
    GoogleProvider(clientId: "")
  ];
  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApplicationAppBar(allowLeading: false),
      body: SignInScreen(
        providers: providers,
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            Navigator.popAndPushNamed(context, '/home');
          }),
        ],
      ),
    );
  }
}
