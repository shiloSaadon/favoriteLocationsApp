import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' hide AuthProvider;
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:nav_app_4_host/providers/auth_provider.dart';
import 'package:nav_app_4_host/providers/theme_provider.dart';
import 'package:nav_app_4_host/secrets.dart';
import 'package:nav_app_4_host/ui/pages/home_page/home_page.dart';
import 'package:nav_app_4_host/ui/pages/sign_in_page/sign_in.dart';
import 'package:nav_app_4_host/utils/genral_utils.dart';
import 'package:provider/provider.dart';

import 'app_const/app_configuration.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    GoogleProvider(clientId: GOOGLE_WEB_CLIENT_ID),
  ]);
  runApp(
    MultiProvider(providers: appProviders, child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    overLaysHandling(); // full screen
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeProvider>().currentTheme,
      initialRoute:
          AuthProvider().getConnectedUser() == null ? '/sign-in' : '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/sign-in': (context) => SignIn()
      },
    );
  }
}
