import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

double progressValue = 0;

class HydrationScreen extends StatefulWidget {
  const HydrationScreen({Key? key}) : super(key: key);

  @override
  State<HydrationScreen> createState() => _HydrationScreenState();
}

class Result extends ChangeNotifier {}

class _HydrationScreenState extends State<HydrationScreen> {
  final int _counter = 0;
  String result = '0';
  String waterAmount = '0';

  void _incrementCounter() {
    setState(() {
      int sum = _counter + 250;
      result = sum.toString();
      progressValue += 250;
      //_counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter == 0) {
        result = '0';
      } else {
        int sum = _counter - 250;
        result = sum.toString();
      }
      if (progressValue == 0) {
        progressValue = 0;
      } else {
        progressValue -= 250;
      }
      //_counter--;
    });
  }

  void changeProgress() {
    setState(() {});
  }

  String getWaterAmount(var water) {
    if (waterAmount == '0') {
      return '1800ml';
    } else {
      return waterAmount.toString() + 'ml';
    }
  }

  List<String> quotes = [
    'Bądź jak woda – przystosowuje się do każdego naczynia, a może zniszczyć skałę.',
    'Ludzie są jak morze, czasem łagodni i przyjaźni, czasem burzliwi i zdradliwi. Przede wszystkim to jednak tylko woda.',
    'Żyjemy niczym woda spływająca z góry, podążając mniej więcej w tym samym kierunku, póki jakaś przeszkoda nie zmusi nas do poszukania nowego koryta.',
    'Bądź niczym bijące źródło, nie zaś jak staw, w którym zawsze stoi ta sama woda.',
    'Chcesz być zdrowy, młody, nie stroń nigdy od wody.',
    'Wszystkie istoty ciągną do wody i wokół niej organizują swoje życie. Podobnie ludzkość. Sercem każdej społeczności jest woda: wielka jak morze albo mała jak źródełko.',
    'Woda pokrywa 70,9 procent powierzchni planety.',
    'W atmosferze jest więcej wody niż we wszystkich naszych rzekach razem wziętych.',
    'Meduza i ogórek to w 95% woda.',
    'Woda jest najważniejszym zasobem na świecie.',
    'Czasami gorąca woda może zamarznąć szybciej niż zimna woda, jest to tzw. efekt Mpemba',
    'Woda składa się z dwóch pierwiastków: wodoru i tlenu. 2 wodory + 1 tlen = H2O.',
    'NASA odkryła wodę w formie lodu na księżycu.',
    'Woda jest drugą naczystszą cząsteczką we wszechświecie. Pierwszą jest wodór H2',
  ];

  String displayQuote = 'Count Your Water';

  String getQuote() {
    final _random = Random();
    displayQuote = quotes[_random.nextInt(quotes.length)];
    //displayQuote = quote;
    return displayQuote;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfRadialGauge(
          axes: [
            RadialAxis(
              showLabels: false,
              showTicks: false,
              minimum: 0,
              maximum: 1800,
              interval: 250,
              radiusFactor: 0.8,
              axisLineStyle: const AxisLineStyle(
                thickness: 0.1,
                color: Color.fromARGB(30, 0, 169, 181),
                thicknessUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.startCurve,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                  value: progressValue,
                  width: 0.1,
                  sizeUnit: GaugeSizeUnit.factor,
                  cornerStyle: CornerStyle.bothCurve,
                  enableAnimation: true,
                  animationType: AnimationType.linear,
                  //  animationDuration: 20,
                )
              ],
              annotations: [
                GaugeAnnotation(
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Cel dnia',
                      ),
                      Text(
                        '${progressValue.toInt()}/${getWaterAmount(waterAmount)}',
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
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () => setState(() {
            getQuote();
          }),
          child: SizedBox(
            width: 300,
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  displayQuote,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 15, fontFamily: 'Cinzel'),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
