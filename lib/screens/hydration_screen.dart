import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:count_your_water/screens/profile_screen.dart';


import '../constants.dart';

double progressValue = 0;

double max_number=1800 ;
double max(double number){
double num=double.parse(waterAmount);
  if(num==0){
    number=1800;
  }
  else {
    number=double.parse(waterAmount);
  }
  return number;
}

String WaterAmount(var water) {
  if (waterAmount == '0') {
    return '1800ml';
  } else {
      return waterAmount.toString() + 'ml';
  }
}

class HydrationScreen extends StatefulWidget {
  const HydrationScreen({Key? key}) : super(key: key);

  @override
  State<HydrationScreen> createState() => _HydrationScreenState();
}

class Result extends ChangeNotifier {}

class _HydrationScreenState extends State<HydrationScreen> {
  final int _counter = 0;
  String result = '0';


  void _incrementCounter() {
    setState(() {
      int sum = _counter + 250;
      result = sum.toString();
      progressValue += 250;
    });
    renewItem();
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
    });
    renewItem();
  }

  void changeProgress() {
    setState(() {});
  }

//<<<<<<< HEAD


//<<<<<<< HEAD

  //int waterAmountFinal=int.parse(waterAmount);

//=======
  String displayQuote = 'Count Your Water';

  String getQuote() {
    final _random = Random();
    displayQuote = quotes[_random.nextInt(quotes.length)];
    return displayQuote;
  }

//>>>>>>> 4469d2967508cc8127e59dcd8f1661aceaf35c14
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SfRadialGauge(
          axes: [
            RadialAxis(
              showLabels: false,
              showTicks: false,
              minimum: 0,
              maximum: max(max_number),
              interval: 250,
              radiusFactor: 1,
              axisLineStyle: const AxisLineStyle(
                thickness: 0.1,
                color: Color.fromARGB(30, 0, 169, 181),
                thicknessUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.bothCurve,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                  value: progressValue,
                  width: 0.1,
                  sizeUnit: GaugeSizeUnit.factor,
                  cornerStyle: CornerStyle.bothCurve,
                  enableAnimation: true,
                  animationType: AnimationType.linear,
                )
              ],
              annotations: [
                GaugeAnnotation(
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 100),
                      const Text(
                        'Cel dnia',
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                      Text(
                        ' ${progressValue.toInt()}/${WaterAmount(waterAmount)}',
                        style: TextStyle(fontSize: 34, color: Colors.grey[700], fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //const SizedBox(width: 15),
                          FloatingActionButton(
                            elevation: 0,
                            onPressed: _decrementCounter,
                            child: const Icon(Icons.remove, color: Colors.blue, size: 50),
                            backgroundColor: Colors.white10,
                          ),
                          const SizedBox(width: 3),
                          const SizedBox(
                            width: 85,
                            height: 120,
                            child: Image(
                              image: AssetImage('images/icon.png'),
                              //width: 300,
                            ),
                          ),
                          const SizedBox(width: 3),
                          const SizedBox(
                            width: 20,
                          ),
                          FloatingActionButton(
                            elevation: 3,
                            onPressed:
                              _incrementCounter,
                            child: const Icon(Icons.add, color: Colors.blue, size: 50),
                            backgroundColor: Colors.white10,
                          ),
                        ],
                      )
                      const Text(
                        '250ml',
                        style: TextStyle(fontSize: 24, color: Colors.black54),
                      ),
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
            width: 360,
            height: 130,
            child: Card(
              elevation: 0,
              color: Color.fromARGB(30, 0, 169, 181),
              //child: Padding(
                //padding: const EdgeInsets.all(25.0),
                child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 20,
                          right: 20,
                          child: Text(
                            displayQuote,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18, fontFamily: 'Cinzel', fontWeight: FontWeight.bold, color: Colors.black54),
                          ),
                       ),
                    ],
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

