// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCUjdDCYwHSBoTQYgHEO0ArKMUzbEiPYkc',
    appId: '1:345542020859:web:258116b31a7a1b07eaea5e',
    messagingSenderId: '345542020859',
    projectId: 'social-app-f18d0',
    authDomain: 'social-app-f18d0.firebaseapp.com',
    storageBucket: 'social-app-f18d0.firebasestorage.app',
    measurementId: 'G-NVX3HGTYCB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbYEUkawcVjL2GPnwg64ULA22Tcw07iNM',
    appId: '1:345542020859:android:8c6738dfa69de977eaea5e',
    messagingSenderId: '345542020859',
    projectId: 'social-app-f18d0',
    storageBucket: 'social-app-f18d0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiE2EiWuUUf-XRTOa8Yw4Y8OH7qVqeI2Y',
    appId: '1:345542020859:ios:65b7f8ece80c54dceaea5e',
    messagingSenderId: '345542020859',
    projectId: 'social-app-f18d0',
    storageBucket: 'social-app-f18d0.firebasestorage.app',
    iosBundleId: 'com.example.socialApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCiE2EiWuUUf-XRTOa8Yw4Y8OH7qVqeI2Y',
    appId: '1:345542020859:ios:65b7f8ece80c54dceaea5e',
    messagingSenderId: '345542020859',
    projectId: 'social-app-f18d0',
    storageBucket: 'social-app-f18d0.firebasestorage.app',
    iosBundleId: 'com.example.socialApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCUjdDCYwHSBoTQYgHEO0ArKMUzbEiPYkc',
    appId: '1:345542020859:web:b2d34bb2c903a91aeaea5e',
    messagingSenderId: '345542020859',
    projectId: 'social-app-f18d0',
    authDomain: 'social-app-f18d0.firebaseapp.com',
    storageBucket: 'social-app-f18d0.firebasestorage.app',
    measurementId: 'G-JG6SPL0SE7',
  );
}
