import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../constants.dart';

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
    });
  }

  void changeProgress() {
    setState(() {});
  }

<<<<<<< HEAD
//<<<<<<< HEAD


  String WaterAmount(var water) {

=======
  String getWaterAmount(var water) {
>>>>>>> f84e3118161842de650f636d45247436a21c2d70
    if (waterAmount == '0') {
      return '1800ml';
    } else {
      return waterAmount.toString() + 'ml';
    }
  }

<<<<<<< HEAD
//<<<<<<< HEAD



  double max_number=1800 ;
  double max(double number){
    double num=double.parse(waterAmount);
    if(num==0){
      number=1800;
    }
    else {
      number=double.parse(waterAmount);
=======
  double maxNumber = 1800;
  double max(double number) {
    double num = double.parse(waterAmount);
    if (num == 0) {
      number = 1800;
    } else {
      number = double.parse(waterAmount);
>>>>>>> f84e3118161842de650f636d45247436a21c2d70
    }
    return number;
  }

  //int waterAmountFinal=int.parse(waterAmount);

<<<<<<< HEAD
//=======
=======
>>>>>>> f84e3118161842de650f636d45247436a21c2d70
  String displayQuote = 'Count Your Water';

  String getQuote() {
    final _random = Random();
    displayQuote = quotes[_random.nextInt(quotes.length)];
    return displayQuote;
  }

<<<<<<< HEAD
//>>>>>>> 4469d2967508cc8127e59dcd8f1661aceaf35c14
=======
>>>>>>> f84e3118161842de650f636d45247436a21c2d70
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
              maximum: max(maxNumber),
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
                        '${progressValue.toInt()}/${WaterAmount(waterAmount)}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: kLightBlue,
                            elevation: 3,
                            onPressed: _decrementCounter,
                            child: const Icon(Icons.minimize_sharp),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          FloatingActionButton(
                            backgroundColor: kLightBlue,
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
