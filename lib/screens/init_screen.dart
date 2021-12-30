import 'package:count_your_water/constants.dart';
import 'package:count_your_water/screens/hydration_screen.dart';
import 'package:count_your_water/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'history_screen.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlue,
          title: const Text('Count Your Water'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.history),
                text: 'History',
              ),
              Tab(
                icon: Icon(Icons.water),
                text: 'Hydration',
              ),
              Tab(
                icon: Icon(Icons.account_circle_outlined),
                text: 'Profile',
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
