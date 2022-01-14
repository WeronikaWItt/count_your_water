import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:count_your_water/constants.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  AwesomeNotifications().initialize(
    '@mipmap/launcher_icon',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: kBlue,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        channelDescription: 'Basic channel',
      ),
    ],
  );
  runApp(const App());
}
