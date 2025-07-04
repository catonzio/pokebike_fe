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
    apiKey: 'AIzaSyBeaFkUsnYuIFKPGMAEJT0dmUrUJsoVnmA',
    appId: '1:995219122710:web:46d49b18d03efac26ba337',
    messagingSenderId: '995219122710',
    projectId: 'pokebike-9ac6c',
    authDomain: 'pokebike-9ac6c.firebaseapp.com',
    storageBucket: 'pokebike-9ac6c.appspot.com',
    measurementId: 'G-LMKVTQXM07',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgxGw4yheBvy2qW7H96qEMDLoAFG-3xU4',
    appId: '1:995219122710:android:dd2eefce4cad63516ba337',
    messagingSenderId: '995219122710',
    projectId: 'pokebike-9ac6c',
    storageBucket: 'pokebike-9ac6c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxahVRgVvjfXhk2_BL9tBaVM40MQskj5U',
    appId: '1:995219122710:ios:9a8cc23a5dc7cdb86ba337',
    messagingSenderId: '995219122710',
    projectId: 'pokebike-9ac6c',
    storageBucket: 'pokebike-9ac6c.appspot.com',
    iosBundleId: 'com.resmedia.pokebike',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBxahVRgVvjfXhk2_BL9tBaVM40MQskj5U',
    appId: '1:995219122710:ios:9a8cc23a5dc7cdb86ba337',
    messagingSenderId: '995219122710',
    projectId: 'pokebike-9ac6c',
    storageBucket: 'pokebike-9ac6c.appspot.com',
    iosBundleId: 'com.resmedia.pokebike',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBeaFkUsnYuIFKPGMAEJT0dmUrUJsoVnmA',
    appId: '1:995219122710:web:86223cc88be49ed06ba337',
    messagingSenderId: '995219122710',
    projectId: 'pokebike-9ac6c',
    authDomain: 'pokebike-9ac6c.firebaseapp.com',
    storageBucket: 'pokebike-9ac6c.appspot.com',
    measurementId: 'G-VNMZQE8DBC',
  );
}
