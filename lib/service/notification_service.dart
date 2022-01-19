import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  var scheduledTime = DateTime.now().add(const Duration(seconds: 5));

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

  static void showNotify({
    required String title,
    required String details,
    required String payload,
    int id = 0,
  }) async {
    _notifications.show(
      id,
      title,
      details,
      await _notificationDetails(),
      payload: payload,
    );
  }

  static void showClickScheduledNotify({
    String? title,
    String? details,
    String? payload,
    required DateTime dateTime,
    int id = 0,
  }) async {
    _notifications.zonedSchedule(
        id,
        title,
        details,
        tz.TZDateTime.from(dateTime, tz.local),
        // _scheduleDaily(
        //   const Time(23),
        // ),
        await _notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  static void showScheduledNotify({
    String? title,
    String? details,
    String? payload,
    required DateTime dateTime,
    int id = 0,
  }) async {
    _notifications.zonedSchedule(
        id,
        title,
        details,
        _scheduleDaily(
          const Time(12, 30),
        ),
        await _notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  static tz.TZDateTime _scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduleTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
      time.second,
    );
    return scheduleTime.isBefore(now) ? scheduleTime.add(const Duration(days: 1)) : scheduleTime;
  }
}
