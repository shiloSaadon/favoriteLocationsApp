// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBw8k5OzsSh39-DqSX9SeCuzbOLQlARyM0',
    appId: '1:660378903943:web:14f7dd6610787bbc6f1f22',
    messagingSenderId: '660378903943',
    projectId: 'navapp4host',
    authDomain: 'navapp4host.firebaseapp.com',
    storageBucket: 'navapp4host.appspot.com',
    measurementId: 'G-45H15306YG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKZ0MTETKjvTig04hzSCCQYa01op24bvw',
    appId: '1:660378903943:android:b7471fbeca840bab6f1f22',
    messagingSenderId: '660378903943',
    projectId: 'navapp4host',
    storageBucket: 'navapp4host.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_Dgk8v5qKJJDSwjbwFFuXNqpjS46EqUg',
    appId: '1:660378903943:ios:688f015276cffd4a6f1f22',
    messagingSenderId: '660378903943',
    projectId: 'navapp4host',
    storageBucket: 'navapp4host.appspot.com',
    iosClientId: '660378903943-rbldpl1309bi6m4h5raita1pt7dtp1f6.apps.googleusercontent.com',
    iosBundleId: 'com.example.navApp4Host',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_Dgk8v5qKJJDSwjbwFFuXNqpjS46EqUg',
    appId: '1:660378903943:ios:688f015276cffd4a6f1f22',
    messagingSenderId: '660378903943',
    projectId: 'navapp4host',
    storageBucket: 'navapp4host.appspot.com',
    iosClientId: '660378903943-rbldpl1309bi6m4h5raita1pt7dtp1f6.apps.googleusercontent.com',
    iosBundleId: 'com.example.navApp4Host',
  );
}
