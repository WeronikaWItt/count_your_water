import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  static Future<void> createWaterReminder() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: 'basic_channel',
        title: 'Count Your Water',
        body: 'Czas napełnić szklankę i wypić wodę ${Emojis.time_hourglass_done}',
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }

  // static final _notifications = FlutterLocalNotificationsPlugin();
  // static final onNotifications = BehaviorSubject<String?>();
  //
  // var scheduledTime = DateTime.now().add(const Duration(seconds: 5));
  //
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //
  // static Future _notificationDetails() async {
  //   return const NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         'channel id',
  //         'channel name',
  //         importance: Importance.max,
  //       ),
  //       iOS: IOSNotificationDetails());
  // }
  //
  // static Future init({bool initScheduled = false}) async {
  //   const iOS = IOSInitializationSettings();
  //   const android = AndroidInitializationSettings('@mipmap/launcher_icon');
  //
  //   const initializationSettings = InitializationSettings(android: android, iOS: iOS);
  //
  //   await _notifications.initialize(initializationSettings, onSelectNotification: (payload) async {
  //     onNotifications.add(payload);
  //   });
  // }
  //
  // static void showNotify({
  //   required String title,
  //   required String details,
  //   required String payload,
  //   int id = 0,
  // }) async {
  //   _notifications.show(
  //     id,
  //     title,
  //     details,
  //     await _notificationDetails(),
  //     payload: payload,
  //   );
  // }

  // static void showScheduledNotify({
  //   required String title,
  //   required String details,
  //   required String payload,
  //   required DateTime dateTime,
  //   int id = 0,
  // }) async {
  //   _notifications.zonedSchedule(
  //     id,
  //     title,
  //     details,
  //     tz.TZDateTime.from(
  //       dateTime,
  //     ),
  //     await _notificationDetails(),
  //     payload: payload,
  //     androidAllowWhileIdle: true,
  //     uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
  //   );
  // }
}
