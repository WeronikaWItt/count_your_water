import 'package:count_your_water/screens/home_screen.dart';
import 'package:count_your_water/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
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
          title: const Text('Count Your Water'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.history),
              ),
              Tab(
                icon: Icon(Icons.water),
              ),
              Tab(
                icon: Icon(Icons.account_circle_outlined),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HistoryScreen(),
            HomeScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
