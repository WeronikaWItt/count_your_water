import 'package:count_your_water/screens/history_screen.dart';
import 'package:count_your_water/screens/profile_screen.dart';
import 'package:count_your_water/screens/hydration_screen.dart';
import 'package:flutter/material.dart';

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

String _getCurrentDate(String _currentData)
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
  _getCurrentDate(dmy)


];

List <String> water=[
  _getCurrentAmount(progressValue.toString())


];