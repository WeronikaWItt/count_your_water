import 'package:flutter/material.dart';

class HydrationScreen extends StatefulWidget {
  const HydrationScreen({Key? key}) : super(key: key);

  @override
  State<HydrationScreen> createState() => _HydrationScreenState();
}

class _HydrationScreenState extends State<HydrationScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 45),
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(250), border: Border.all(width: 10, color: Colors.blue)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Cel dnia',
              ),
              Text(
                '$_counter/1800ml',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    elevation: 3,
                    onPressed: _decrementCounter,
                    child: const Icon(Icons.minimize_sharp),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    elevation: 3,
                    onPressed: _incrementCounter,
                    child: const Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ),
        GestureDetector(
          child: const SizedBox(
            width: 300,
            child: Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Bądź jak woda – przystosowuje się do każdego naczynia, a może zniszczyć skałę.'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
