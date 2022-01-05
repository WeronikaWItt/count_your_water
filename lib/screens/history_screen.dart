import 'package:flutter/material.dart';

DateTime date = DateTime.now();

String dmy='${date.day}/${date.month}/${date.year}';

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
                  Text('$dmy'),
                  Text('1500/1800 ml'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
