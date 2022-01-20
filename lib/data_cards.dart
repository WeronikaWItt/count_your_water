


/*
import 'package:flutter/material.dart';
import 'package:count_your_water/screens/history_screen.dart';
import 'package:count_your_water/screens/hydration_screen.dart';
import 'dart:async';


List<String> _items = [];

// This variable determines whether the timer runs or not
bool isRunning = true;

 */
/*
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // This list hold the items of the list view


  // This function will be triggered every 1 second
  void _addItem() {
    final DateTime now = DateTime.now();
    setState(() {
      _items.add("${now.hour}:${now.minute}:${now.second}");
    });
  }

  @override
  void initState() {
    Timer.periodic(Duration(days: 1), (Timer timer) {
      if (!isRunning) {
        timer.cancel();
      }
      _addItem();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kindacode.com'),
      ),
      body: ListView.builder(
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
        },
      ),

    );
  }
}*/

/*const timeout = const Duration(seconds: 3);
const ms = const Duration(milliseconds: 1);

startTimeout([int? milliseconds]) {
  var duration = milliseconds == null ? timeout : ms * milliseconds;
  return new Timer(duration, handleTimeout);
}

void handleTimeout() {  // callback function

}*/




/*
int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

void onEnd() {
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

  );
}*/






/*abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String _currentDate;

  HeadingItem(this._currentDate);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      _currentDate,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}

final items = List<ListItem>.generate(
  1000,
      (i) => i % 6 == 0
      ? HeadingItem('Heading $i')
      : MessageItem('Sender $i', 'Message body $i'),
);*/




/*class MessageItem implements ListItem {
  String _currrentData=saveProgress(dmy);

  MessageItem(this._currrentData);

  @override
  Widget buildTitle(BuildContext context) => Text(_currrentData);

}*/


/*
String getCurrentDate(String _currentData)
{
  final _date;

  if(progressValue.toString()!='0.0'){
    _date= saveProgress(dmy).toString();
}else{
    _date=dmy;
  }
  return _date;
}

String _getCurrentAmount(String _currentWaterAmount)
{

  final _waterAmount;

  if(progressValue.toString()!='0.0'){

    _waterAmount=progressValue;
  }else{
    _waterAmount='Nie pileś jeszce wody';

  }
  return _waterAmount;

}

List <String> data=[
  getCurrentDate(dmy)


];

List <String> water=[
  _getCurrentAmount(progressValue.toString())


]*/