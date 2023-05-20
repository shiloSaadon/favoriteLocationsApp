import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nav_app_4_host/providers/user_provider.dart';
import 'package:nav_app_4_host/services.dart/auth.dart';

class AuthProvider extends ChangeNotifier {
  static final AuthProvider _singleton = AuthProvider._internal();

  AuthProvider._internal();

  factory AuthProvider() {
    AuthProvider object = _singleton;
    return object;
  }

  /// Sign the user out and push the signIn page
  void signOut(BuildContext context) {
    Auth().signOuth();
    UserProvider().initUser();
    //MapProvider().emptyMap();
    // pushing the loggin screen
    Navigator.popAndPushNamed(context, '/sign-in');
    updateState();
  }

  /// current connecte user - can be null if no user is connected
  User? getConnectedUser() {
    return Auth().user;
  }

  void updateState() => notifyListeners();
}
