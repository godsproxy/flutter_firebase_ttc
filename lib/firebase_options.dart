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
    apiKey: 'AIzaSyBsq_BXcZAYoJnka_Ug1VxOTLnxse1k-sE',
    appId: '1:502726819871:web:4ad87e57a7b237bfe7152a',
    messagingSenderId: '502726819871',
    projectId: 'learned-digit-374018',
    authDomain: 'learned-digit-374018.firebaseapp.com',
    databaseURL: 'https://learned-digit-374018-default-rtdb.firebaseio.com',
    storageBucket: 'learned-digit-374018.appspot.com',
    measurementId: 'G-0VY7ZGLBQB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsITqGqLBAiKFRW3zFjGGVnoDnOqI3k3o',
    appId: '1:502726819871:android:b95783b4baa27a76e7152a',
    messagingSenderId: '502726819871',
    projectId: 'learned-digit-374018',
    databaseURL: 'https://learned-digit-374018-default-rtdb.firebaseio.com',
    storageBucket: 'learned-digit-374018.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZggmkNco7crw7ZoYry45jzlvpZcd9ta4',
    appId: '1:502726819871:ios:7a564badef24b6f0e7152a',
    messagingSenderId: '502726819871',
    projectId: 'learned-digit-374018',
    databaseURL: 'https://learned-digit-374018-default-rtdb.firebaseio.com',
    storageBucket: 'learned-digit-374018.appspot.com',
    iosClientId: '502726819871-2orqos5tjkb9i4vj919qra38g4lce5i1.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebaseTtc',
  );
}
