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
    apiKey: 'AIzaSyCo7ELIx1nR3H17cDQDwH5O5Xzq1ykGk4Y',
    appId: '1:763058138555:web:ae2973f954107c2606289e',
    messagingSenderId: '763058138555',
    projectId: 'smart-me-43d42',
    authDomain: 'smart-me-43d42.firebaseapp.com',
    storageBucket: 'smart-me-43d42.appspot.com',
    measurementId: 'G-YSERQ8H26K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5L4NvVBfa72dNGEq9to6yN6WEgiWMX78',
    appId: '1:763058138555:android:fcd0a94d6618c92506289e',
    messagingSenderId: '763058138555',
    projectId: 'smart-me-43d42',
    storageBucket: 'smart-me-43d42.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7AeHi_2XFmPmVdaxVp15oqPCjMzVdpUY',
    appId: '1:763058138555:ios:02201c90773c981906289e',
    messagingSenderId: '763058138555',
    projectId: 'smart-me-43d42',
    storageBucket: 'smart-me-43d42.appspot.com',
    iosClientId: '763058138555-iqdne9773qjm1vqgcibg8i9vla0silgu.apps.googleusercontent.com',
    iosBundleId: 'com.example.smartMe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA7AeHi_2XFmPmVdaxVp15oqPCjMzVdpUY',
    appId: '1:763058138555:ios:02201c90773c981906289e',
    messagingSenderId: '763058138555',
    projectId: 'smart-me-43d42',
    storageBucket: 'smart-me-43d42.appspot.com',
    iosClientId: '763058138555-iqdne9773qjm1vqgcibg8i9vla0silgu.apps.googleusercontent.com',
    iosBundleId: 'com.example.smartMe',
  );
}
