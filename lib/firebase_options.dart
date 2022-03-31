// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDH9zoTgrgXVKM8OGVUY-fUN39XLxzIw7U',
    appId: '1:1097250068658:web:476ffb71fbc788d8e1d1ab',
    messagingSenderId: '1097250068658',
    projectId: 'recommended-app-c1aae',
    authDomain: 'recommended-app-c1aae.firebaseapp.com',
    storageBucket: 'recommended-app-c1aae.appspot.com',
    measurementId: 'G-H9SD1P8QZZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAE14koBFafOmA3_Gpat3TfRCnfVwluQTY',
    appId: '1:1097250068658:android:3974da7b198d5c2ce1d1ab',
    messagingSenderId: '1097250068658',
    projectId: 'recommended-app-c1aae',
    storageBucket: 'recommended-app-c1aae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1PA5YQEh4PSwoETaqd6hE_J4OlvAwfh4',
    appId: '1:1097250068658:ios:7901f8290991ba4de1d1ab',
    messagingSenderId: '1097250068658',
    projectId: 'recommended-app-c1aae',
    storageBucket: 'recommended-app-c1aae.appspot.com',
    iosClientId: '1097250068658-02v0bnvulkeb17eb120fs1evda6oknh4.apps.googleusercontent.com',
    iosBundleId: 'com.cmoyates.recommended.app',
  );
}