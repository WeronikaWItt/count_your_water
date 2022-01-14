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
    NotificationService.init(initScheduled: false);
    listenNotify();

    // NotificationService.showScheduledNotify(
    //     title: 'Count Your Water',
    //     details: 'Czas na szklankę',
    //     payload: 'glass_of_water',
    //     dateTime: DateTime.now().add(const Duration(seconds: 12)));
  }

  void listenNotify() => NotificationService.onNotifications.stream.listen(onClickedNotify);
  void onClickedNotify(String? payload) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const InitScreen()),
      );
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
