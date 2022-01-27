import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:count_your_water/constants.dart';
import 'package:count_your_water/screens/history_screen.dart';
import 'package:count_your_water/screens/hydration_screen.dart';
import 'package:count_your_water/screens/profile_screen.dart';
import 'package:count_your_water/service/notification_service.dart';
import 'package:flutter/material.dart';

import 'history_screen.dart';

//List<String> items = [];
//bool isRunning = true;
const TimeOfDay renewTime = TimeOfDay(hour: 6, minute: 00);

void checkTime() {
  Timer.periodic(const Duration(seconds: 60), (Timer timer) {
    if (TimeOfDay.now() == renewTime) {
      count++;
      progressValue = 0;
      addItem();
    }
    else{
      timer.cancel();
    }
  });
}

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {

  @override
  void initState() {
    NotificationService.init(initScheduled: false);
    NotificationService.showClickScheduledNotify(
        title: '${Emojis.wheater_droplet} Czas napełnić szklankę i wypić wodę!',
        payload: 'drink_water',
        dateTime: DateTime.now().add(const Duration(seconds: 12)));

    Timer.periodic(const Duration(minutes: 1), (Timer timer) {
      if (!isRunning) {
        timer.cancel();
      }
      addItem();
    });
    checkTime();
    super.initState();
  }

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
