import 'package:count_your_water/screens/hydration_screen.dart';
import 'package:flutter/material.dart';

import 'dart:async';

DateTime date = DateTime.now();

String dmy = '${date.day}/${date.month}/${date.year}';
String yesterday = '${date.day - 1}/${date.month}/${date.year}';
String waterAmount = '0';

String getWaterAmount(var water) {
  if (waterAmount == '0') {
    return '1800ml';
  } else {
    return waterAmount.toString() + 'ml';
  }
}

String saveProgress(String savedDate) {
  String currentDate = yesterday;
  String d = '';
  if (currentDate == savedDate) {
    return currentDate;
  } else {
    d = savedDate;
    return d;
  }
}

String newDate = "10/1/2022";



List<String> _items = [];

// This variable determines whether the timer runs or not
bool isRunning = true;

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  void _addItem() {
    _items.add(saveProgress(dmy));

  }

  @override
  void initState() {
    Timer.periodic(const Duration(minutes: 1), (Timer timer) {
      if (!isRunning) {
        timer.cancel();
      }
      _addItem();
    });
    initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
    child: Expanded(
      child: Column(
          children: [
      ListView.builder(
        scrollDirection: Axis.horizontal,
      itemCount: _items.length,
        itemBuilder: (_, index) {
          return Card(
            margin: EdgeInsets.all(10),
            color: Colors.amber,
            elevation: 5,
            child: ListTile(

              title: Text(_items[index]),
            ),
          );
        },),
          ],
      ),
    ),



    );
   /*
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          ListView(
             prototypeItem:
             Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(newDate),
                    Text('$progressValue/${getWaterAmount(waterAmount)}'),
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(yesterday),
                  Text('$progressValue/${getWaterAmount(waterAmount)}'),
                ],
              ),
            ),
          ),
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(saveProgress(dmy)),
                  Text('$progressValue/${getWaterAmount(waterAmount)}'),
                ],
              ),
            ),
          ),
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(''),

                ],
              ),
            ),
          ),
        ],
      ),
    );*/
  }
}
