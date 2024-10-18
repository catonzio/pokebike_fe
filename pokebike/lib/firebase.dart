import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pokebike/firebase_options.dart';

class FirebaseInitializer {
  static Future<String?> initialize() async {
    FirebaseInitializer firebaseInitializer = FirebaseInitializer();
    await firebaseInitializer.initializeFirebase();
    return await firebaseInitializer.requestPermissions();
    // firebaseInitializer.initializeOnMessageForeground();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<String?> requestPermissions() async {
    final messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // It requests a registration token for sending messages to users from your App server or other trusted server environment.
    String? token = await messaging.getToken();

    return token;
  }

  // initializeOnMessageForeground() {
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //   FirebaseMessaging.onMessage.listen(_firebaseMessagingForegroundHandler);
  // }
}