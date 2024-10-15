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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcbA3Xj3nWZPTHOpqgr08repC3MU5_FA4',
    appId: '1:329947219311:android:3cc0f1475c38f17084549a',
    messagingSenderId: '329947219311',
    projectId: 'medical-app-bef4b',
    databaseURL: 'https://medical-app-bef4b-default-rtdb.firebaseio.com',
    storageBucket: 'medical-app-bef4b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZq1dlSsD5Dqxfld0AZzBVaRxmdLxRKV4',
    appId: '1:329947219311:ios:b08b123e0ce8d7ca84549a',
    messagingSenderId: '329947219311',
    projectId: 'medical-app-bef4b',
    databaseURL: 'https://medical-app-bef4b-default-rtdb.firebaseio.com',
    storageBucket: 'medical-app-bef4b.appspot.com',
    androidClientId: '329947219311-v1sg959fsshdt1gs9dco0a330067gdi4.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceTask',
  );
}
