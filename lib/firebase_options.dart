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
    apiKey: 'AIzaSyDLl7xBtFD50ZJXE9rDpS8sb9e75anBbsc',
    appId: '1:855805746270:web:d7bd8183e65bcb851b68cf',
    messagingSenderId: '855805746270',
    projectId: 'aavishkars3',
    authDomain: 'aavishkars3.firebaseapp.com',
    storageBucket: 'aavishkars3.appspot.com',
    measurementId: 'G-HR1LQQTZYH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIbqo1V759S3tRI3l0d46FWXGvrE4Hg5U',
    appId: '1:855805746270:android:8d53de2a07f28baf1b68cf',
    messagingSenderId: '855805746270',
    projectId: 'aavishkars3',
    storageBucket: 'aavishkars3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDXx2axj9LcG1Q4mx4WLTN2k5BRlEYKW-8',
    appId: '1:855805746270:ios:44a99c334bece6d01b68cf',
    messagingSenderId: '855805746270',
    projectId: 'aavishkars3',
    storageBucket: 'aavishkars3.appspot.com',
    iosBundleId: 'com.example.sih',
  );
}
