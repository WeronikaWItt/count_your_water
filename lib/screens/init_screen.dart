import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:count_your_water/constants.dart';
import 'package:count_your_water/screens/hydration_screen.dart';
import 'package:count_your_water/screens/profile_screen.dart';
import 'package:count_your_water/service/notification_service.dart';
import 'package:flutter/material.dart';

import 'history_screen.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Zezwól na powiadomienia'),
              content: const Text('Nasza aplikacja chciałaby wysyłać Tobie powiadomienia'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Odrzuć',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      AwesomeNotifications().requestPermissionToSendNotifications().then((_) => Navigator.pop(context)),
                  child: const Text(
                    'Zezwól',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );

    // NotificationService.init(initScheduled: false);
    // listenNotify();

    // NotificationService.showScheduledNotify(
    //     title: 'Count Your Water',
    //     details: 'Czas na szklankę',
    //     payload: 'glass_of_water',
    //     dateTime: DateTime.now().add(const Duration(seconds: 12)));
  }

  // void listenNotify() => NotificationService.onNotifications.stream.listen(onClickedNotify);
  // void onClickedNotify(String? payload) => Navigator.of(context).push(
  //       MaterialPageRoute(builder: (context) => const InitScreen()),
  //     );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlue,
          centerTitle: true,
          title: const Text(
            'Count Your Water',
            style: TextStyle(fontFamily: 'Cinzel', fontWeight: FontWeight.bold, fontSize: 25),
          ),
          actions: [
            IconButton(
              onPressed: () => NotificationService.createWaterReminder(),
              icon: const Icon(Icons.water),
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.history),
                text: 'Historia',
              ),
              Tab(
                icon: Icon(Icons.water),
                text: 'Cel dnia',
              ),
              Tab(
                icon: Icon(Icons.account_circle_outlined),
                text: 'Profil',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HistoryScreen(),
            HydrationScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
