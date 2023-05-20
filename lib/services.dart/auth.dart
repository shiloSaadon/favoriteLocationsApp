import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  User? user = FirebaseAuth.instance.currentUser;
  static final Auth _singleton = Auth._internal();
  Auth._internal();

  factory Auth() {
    Auth object = _singleton;
    return object;
  }

  void signOuth() {
    FirebaseAuth.instance.signOut();
  }
}
