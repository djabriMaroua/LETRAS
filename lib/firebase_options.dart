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
    apiKey: 'AIzaSyDp_Ypy03JtXUEVVj4YoqJOq18SDf6Bfss',
    appId: '1:300957242048:web:f5152c775ed11597019325',
    messagingSenderId: '300957242048',
    projectId: 'projet-2cp-e33',
    authDomain: 'projet-2cp-e33.firebaseapp.com',
    storageBucket: 'projet-2cp-e33.appspot.com',
    measurementId: 'G-ZW3PREZ1YV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0BfaONGmrdrHWAmkW2SlmEKXA32XTGCI',
    appId: '1:300957242048:android:f557e722b141bf6f019325',
    messagingSenderId: '300957242048',
    projectId: 'projet-2cp-e33',
    storageBucket: 'projet-2cp-e33.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDena6p3L5l509mQi6xZ5004UpKC865c64',
    appId: '1:300957242048:ios:d15884a5fd956393019325',
    messagingSenderId: '300957242048',
    projectId: 'projet-2cp-e33',
    storageBucket: 'projet-2cp-e33.appspot.com',
    iosClientId: '300957242048-3l5uclcimm5aoomj8mafv9uav2nkhg0l.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDena6p3L5l509mQi6xZ5004UpKC865c64',
    appId: '1:300957242048:ios:d15884a5fd956393019325',
    messagingSenderId: '300957242048',
    projectId: 'projet-2cp-e33',
    storageBucket: 'projet-2cp-e33.appspot.com',
    iosClientId: '300957242048-3l5uclcimm5aoomj8mafv9uav2nkhg0l.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication3',
  );
}