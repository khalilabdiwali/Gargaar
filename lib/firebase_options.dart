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
    apiKey: 'AIzaSyCNk3AH7YJFkhU92NMEzm_t-FwWQWBM0Os',
    appId: '1:259987483251:web:336987cee134856c1ed806',
    messagingSenderId: '259987483251',
    projectId: 'myfirstapp-d5314',
    authDomain: 'myfirstapp-d5314.firebaseapp.com',
    storageBucket: 'myfirstapp-d5314.appspot.com',
    measurementId: 'G-E43M9YP3M9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcHAHXDbVwnwFO60L4ppEbC65l7M2buro',
    appId: '1:259987483251:android:374816af5148cb0c1ed806',
    messagingSenderId: '259987483251',
    projectId: 'myfirstapp-d5314',
    storageBucket: 'myfirstapp-d5314.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBkqDORsSF2NGrNlqQyxW-monnVHdHsnOo',
    appId: '1:259987483251:ios:9e8aa3a6b2e7fbdc1ed806',
    messagingSenderId: '259987483251',
    projectId: 'myfirstapp-d5314',
    storageBucket: 'myfirstapp-d5314.appspot.com',
    iosBundleId: 'com.example.sms',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBkqDORsSF2NGrNlqQyxW-monnVHdHsnOo',
    appId: '1:259987483251:ios:a0f0d22a578b7e1d1ed806',
    messagingSenderId: '259987483251',
    projectId: 'myfirstapp-d5314',
    storageBucket: 'myfirstapp-d5314.appspot.com',
    iosBundleId: 'com.example.sms.RunnerTests',
  );
}