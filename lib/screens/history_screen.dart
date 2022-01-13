import 'package:count_your_water/screens/hydration_screen.dart';
import 'package:flutter/material.dart';

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

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}
