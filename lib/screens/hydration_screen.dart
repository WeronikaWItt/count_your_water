import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HydrationScreen extends StatefulWidget {
  const HydrationScreen({Key? key}) : super(key: key);

  @override
  State<HydrationScreen> createState() => _HydrationScreenState();
}

class _HydrationScreenState extends State<HydrationScreen> {
  int _counter = 0;
  double progressValue = 1;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _timer = Timer.periodic(const Duration(milliseconds: 20), (Timer _timer) {
        setState(() {
          if (progressValue == 100) {
            progressValue = 0;
          } else {
            progressValue++;
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
      children: [
        SfRadialGauge(
          axes: [
            RadialAxis(
              showLabels: false,
              showTicks: false,
              minimum: 0,
              maximum: 100,
              // startAngle: 180,
              // endAngle: 0,
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
                  animationDuration: 20,
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
              ],
            ),
          ],
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
