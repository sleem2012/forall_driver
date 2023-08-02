import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import '../../app.dart';
import '../cache/locale_storage.dart';

class NotificationCtrl {
  static const String _icon = '@mipmap/ic_launcher'; // '@mipmap/ic_notification';

  static final _notification = FlutterLocalNotificationsPlugin();

  static InitializationSettings _initializationSettings(String? icon) => InitializationSettings(
        android: AndroidInitializationSettings(icon ?? _icon),
        iOS: const DarwinInitializationSettings(),
      );

  static NotificationDetails _notificationDetails(String channelName) => NotificationDetails(
        iOS: const DarwinNotificationDetails(),
        android: AndroidNotificationDetails(
          channelName,
          channelName,
          channelDescription: channelName,
          importance: Importance.max,
          playSound: true,
          enableVibration: true,
          onlyAlertOnce: true,
          icon: _icon,
        ),
      );

  static Future _initNotification(void Function(NotificationResponse)? onDidReceiveBackground, String? icon) async {
    await _notification.initialize(
      _initializationSettings(icon),
      onDidReceiveBackgroundNotificationResponse: onDidReceiveBackground,
    );
  }

  static Future sendNotification({String? title, String? body, required String channelName}) async {
    _notification.show(1, title, body, _notificationDetails(channelName));
  }

  static Future fcm_init(String channelName, {String? icon}) async {
    await Firebase.initializeApp();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await _initNotification(_onDidReceiveBackground, icon);

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    messaging.getToken().then((value) {
      KStorage.i.setFcmToken(value);
    });

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        messaging.setForegroundNotificationPresentationOptions();
        if (message.notification != null) {
          sendNotification(title: message.notification?.title, body: message.notification?.body, channelName: channelName);
        }
      },
    );
  }

  static Future _onDidReceiveBackground(payload) async {
    Get.offAll(() => const Wrapper());
  }
}
