import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:pokebike/app/routes/app_pages.dart';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  final String? payload = notificationResponse.payload;
  if (notificationResponse.payload != null) {
    print('notification payload BACKGROUND: $payload');
  }
  Navigator.pushNamed(Get.context!, Routes.COCKADES_DETAILS);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');
  }
  MessagingInitializer messagingInitializer = MessagingInitializer();
  await messagingInitializer.initialize();
  messagingInitializer.onDidReceiveLocalNotification(message);
}

class MessagingInitializer {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  AndroidNotificationDetails androidNotificationDetails;

  MessagingInitializer()
      : flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin(),
        androidNotificationDetails = const AndroidNotificationDetails(
          'your_channel_id',
          'your_channel_name',
          channelDescription: 'your_channel_description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        );

  Future<void> initialize() async {
    await initializeLocalNotifications();
  }

  Future<void> initializeLocalNotifications() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_firebaseMessagingForegroundHandler);

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            macOS: initializationSettingsDarwin);

    // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //     onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground);
  }

  void _firebaseMessagingForegroundHandler(RemoteMessage message) {
    if (kDebugMode) {
      print('Handling a foreground message: ${message.messageId}');
      print('Message data: ${message.data}');
      print('Message notification: ${message.notification?.title}');
      print('Message notification: ${message.notification?.body}');
    }
    onDidReceiveLocalNotification(message);
    // _messageStreamController.sink.add(message);
  }

  onDidReceiveLocalNotification(RemoteMessage message) async {
    // Extract the notification details from the RemoteMessage object
    String? title = message.notification?.title ?? 'Default Title';
    String? body = message.notification?.body ?? 'Default Body';
    String payload = message.data['payload'] ?? 'default_payload';

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      print('notification payload FOREGROUND: $payload');
    }
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
    // );
  }
}
