import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationServices extends GetxService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static const String channelId = "lofaz_notification_channel";
  static const String channelName = "lofaz Notification channel";
  static const String channelDescription =
      'This channel is used for important notifications.';

  @override
  Future<void> onInit() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');

    InitializationSettings initializationSettings =
        const InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
    const AndroidNotificationChannel updatesChannel =
        AndroidNotificationChannel(
      channelId, // id
      channelName, // title
      description: channelDescription, // description
      importance: Importance.max,
      playSound: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(updatesChannel);

    handelForgroundNotification();

    super.onInit();
  }

  handelForgroundNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channelId, channelName,
              channelDescription: channelDescription,
              icon: android.smallIcon,
              channelShowBadge: true,
              playSound: true,
              priority: Priority.high,
              importance: Importance.high,
              // styleInformation: const BigTextStyleInformation('')
              // other properties...
            ),
            iOS: const DarwinNotificationDetails(),
          ),
          payload: json.encode(message.data),
        );
      }
    });
  }
}
