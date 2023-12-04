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
    apiKey: 'AIzaSyDX79UJn08fAFkIK1SqWNdItEh3HxQR5zM',
    appId: '1:51651556180:web:9816031f5c249f82f88ec1',
    messagingSenderId: '51651556180',
    projectId: 'reelmark-258cd',
    authDomain: 'reelmark-258cd.firebaseapp.com',
    storageBucket: 'reelmark-258cd.appspot.com',
    measurementId: 'G-XTKFHR2KPP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACD3v5mtt0JcfJAUwNmbuGa8kWEPRf1pA',
    appId: '1:51651556180:android:25f6f208152ac477f88ec1',
    messagingSenderId: '51651556180',
    projectId: 'reelmark-258cd',
    storageBucket: 'reelmark-258cd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPAv7LeLt7MwaXTJjuiO3Kz9RAdCHDiUA',
    appId: '1:51651556180:ios:0597e10cb9cf7791f88ec1',
    messagingSenderId: '51651556180',
    projectId: 'reelmark-258cd',
    storageBucket: 'reelmark-258cd.appspot.com',
    iosClientId: '51651556180-4dk0tbiqq4ths9knh3vvf6geeu4lsb0e.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled14',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBPAv7LeLt7MwaXTJjuiO3Kz9RAdCHDiUA',
    appId: '1:51651556180:ios:6e61fd9270abc3a8f88ec1',
    messagingSenderId: '51651556180',
    projectId: 'reelmark-258cd',
    storageBucket: 'reelmark-258cd.appspot.com',
    iosClientId: '51651556180-d734p5q8eg9g1adqq26u1p4mlb5tuunh.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled14.RunnerTests',
  );
}
