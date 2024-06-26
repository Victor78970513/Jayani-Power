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
    apiKey: 'AIzaSyBtsT0rzms7DLyv90m89BMaWU_fp1yC-O0',
    appId: '1:184247539439:web:9158d65ca9072db77c6d1a',
    messagingSenderId: '184247539439',
    projectId: 'jayani-power',
    authDomain: 'jayani-power.firebaseapp.com',
    storageBucket: 'jayani-power.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnnAMdNK33iBjCaC-xLC4sljFvYu7Ger8',
    appId: '1:184247539439:android:4bd47a06dc64ff5e7c6d1a',
    messagingSenderId: '184247539439',
    projectId: 'jayani-power',
    storageBucket: 'jayani-power.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPZ-zt0ettO6rKkPgc66-hMl7DaWiYuww',
    appId: '1:184247539439:ios:0ccdf1dcdb52cda97c6d1a',
    messagingSenderId: '184247539439',
    projectId: 'jayani-power',
    storageBucket: 'jayani-power.appspot.com',
    iosBundleId: 'com.example.jayaniPower',
  );
}
