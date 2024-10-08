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
    apiKey: 'AIzaSyBN_cZlP7yfezRUP0u_1XZbWrMvdMj2mVI',
    appId: '1:841018550326:web:bb059778e73726decc5097',
    messagingSenderId: '841018550326',
    projectId: 'swiggy-70095',
    authDomain: 'swiggy-70095.firebaseapp.com',
    storageBucket: 'swiggy-70095.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDiAzJSERJbxj_atbW-uugU6JvNyaN2a5c',
    appId: '1:841018550326:android:95faa7eecb62ccf1cc5097',
    messagingSenderId: '841018550326',
    projectId: 'swiggy-70095',
    storageBucket: 'swiggy-70095.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcUicBbXprX8c5GUHxQuckCn-DoOOTurk',
    appId: '1:841018550326:ios:ff84ab893711c3d7cc5097',
    messagingSenderId: '841018550326',
    projectId: 'swiggy-70095',
    storageBucket: 'swiggy-70095.appspot.com',
    iosBundleId: 'com.example.swiggy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBcUicBbXprX8c5GUHxQuckCn-DoOOTurk',
    appId: '1:841018550326:ios:ff84ab893711c3d7cc5097',
    messagingSenderId: '841018550326',
    projectId: 'swiggy-70095',
    storageBucket: 'swiggy-70095.appspot.com',
    iosBundleId: 'com.example.swiggy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBN_cZlP7yfezRUP0u_1XZbWrMvdMj2mVI',
    appId: '1:841018550326:web:5ea8e86960181533cc5097',
    messagingSenderId: '841018550326',
    projectId: 'swiggy-70095',
    authDomain: 'swiggy-70095.firebaseapp.com',
    storageBucket: 'swiggy-70095.appspot.com',
  );
}
