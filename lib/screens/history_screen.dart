import 'package:count_your_water/screens/init_screen.dart';
import 'package:count_your_water/screens/hydration_screen.dart';
import 'package:count_your_water/screens/profile_screen.dart';
import 'package:flutter/material.dart';

/*DateTime date = DateTime.now();

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

String newDate = "10/1/2022";*/
// This variable determines whether the timer runs or not

/*String displayDate = 'Date';

String getDate() {
  displayDate = items as String;
  return displayDate;
}
void addItem() {
  final DateTime now = DateTime.now();

  items.add("${now.hour}:${now.minute}:${now.second}");

}*/

List<String> date_items = [];
List<String> water_items = [];
int count = 0;

void addItem() {
  final DateTime now = DateTime.now();
  date_items.insert(0,"${now.day}/${now.month}/${now.year}");
  water_items.insert(0,"${progressValue.toInt()}/${WaterAmount(waterAmount)}");
}

void renewItem() {
  water_items[0] = "${progressValue.toInt()}/${WaterAmount(waterAmount)}";
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: date_items.length,
        itemBuilder: (_, count) {
          return SizedBox(
            width: 360,
            height: 75,
            child: Card(
              margin: EdgeInsets.only(left: 10, right: 10, top: 20)
              color: Colors.blue,
              elevation: 0,
              child: ListTile(
                //reverse: true,
                title: Text(
                    '${date_items[count]}                               ${water_items[count]}',
                    style: TextStyle(color: Colors.white, fontSize: 18)
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

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
    );
  }
}*/
