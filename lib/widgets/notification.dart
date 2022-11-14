import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/ic_stat_account_circle');

    // final IOSInitializationSettings initializationSettingsIOS =
    // IOSInitializationSettings(
    //   requestAlertPermission: false,
    //   requestBadgePermission: false,
    //   requestSoundPermission: false,
    // );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      // iOS: initializationSettingsIOS
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(
      int id, String title, String body, int milliseconds) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(Duration(milliseconds: milliseconds)),
      const NotificationDetails(
        android: AndroidNotificationDetails('main_channel', 'Main Channel',
            //'Main channel notifications',
            importance: Importance.max,
            priority: Priority.max,
            icon: '@drawable/ic_stat_account_circle'),
        // iOS: IOSNotificationDetails(
        //   sound: 'default.wav',
        //   presentAlert: true,
        //   presentBadge: true,
        //   presentSound: true,
        // ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
