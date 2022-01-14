import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          'channel id',
          'channel name',
          importance: Importance.max,
        ),
        iOS: IOSNotificationDetails());
  }

  static Future init({bool initScheduled = false}) async {
    const iOS = IOSInitializationSettings();
    const android = AndroidInitializationSettings('@mipmap/launcher_icon');

    const initializationSettings = InitializationSettings(android: android, iOS: iOS);

    await _notifications.initialize(initializationSettings, onSelectNotification: (payload) async {
      onNotifications.add(payload);
    });
  }

  static void showNotify({required String title, required String details, required String payload, int id = 0}) async {
    _notifications.show(
      id,
      title,
      details,
      await _notificationDetails(),
      payload: payload,
    );
  }
}
