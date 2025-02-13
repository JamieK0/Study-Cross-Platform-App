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
    apiKey: 'AIzaSyDhp5UfsRh8KsvA_NCZ_cGDWFjLG60tqYQ',
    appId: '1:833078639:web:c10da7c387fdad4584949a',
    messagingSenderId: '833078639',
    projectId: 'study-app-567b5',
    authDomain: 'study-app-567b5.firebaseapp.com',
    storageBucket: 'study-app-567b5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmBnrTjG5t-LNHltIO6BWxcH-hJYWv_uQ',
    appId: '1:833078639:android:a81ae40610a1e26584949a',
    messagingSenderId: '833078639',
    projectId: 'study-app-567b5',
    storageBucket: 'study-app-567b5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBOPQBilQSjlWUmzkRJVFozM1WCL0pi88',
    appId: '1:833078639:ios:9c4139fb3385d5b284949a',
    messagingSenderId: '833078639',
    projectId: 'study-app-567b5',
    storageBucket: 'study-app-567b5.appspot.com',
    iosBundleId: 'com.example.study',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBOPQBilQSjlWUmzkRJVFozM1WCL0pi88',
    appId: '1:833078639:ios:95599db13ed700bc84949a',
    messagingSenderId: '833078639',
    projectId: 'study-app-567b5',
    storageBucket: 'study-app-567b5.appspot.com',
    iosBundleId: 'com.example.study.RunnerTests',
  );
}
