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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBjpO7d2YE2BvlTM3hzuPas4_shjC4OADs',
    appId: '1:644350688766:web:407511cc30048fa14b94af',
    messagingSenderId: '644350688766',
    projectId: 'pizza-app-df4bd',
    authDomain: 'pizza-app-df4bd.firebaseapp.com',
    storageBucket: 'pizza-app-df4bd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcwQIxtaCAxknur6OzhJlC76Rxi3anyuc',
    appId: '1:644350688766:android:b56c31e5dd45337e4b94af',
    messagingSenderId: '644350688766',
    projectId: 'pizza-app-df4bd',
    storageBucket: 'pizza-app-df4bd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2zSjbFcAjCCiSqkbmkMo_Ki-Elx7dj7g',
    appId: '1:644350688766:ios:b684c218204fb0e44b94af',
    messagingSenderId: '644350688766',
    projectId: 'pizza-app-df4bd',
    storageBucket: 'pizza-app-df4bd.appspot.com',
    iosBundleId: 'com.example.pizza',
  );
}
