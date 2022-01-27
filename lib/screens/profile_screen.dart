import 'package:count_your_water/widget/custom_input.dart';
import 'package:flutter/material.dart';

import 'history_screen.dart';

enum Gender {
  male,
  female,
}
String waterAmount = '0';
bool isRunning = true;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Gender selectedGender = Gender.female;
  TextEditingController weightController = TextEditingController();
  TextEditingController activityController = TextEditingController();

  String countWaterAmount(var w, var h) {
    double res = 0;
    var weight = double.parse('$w');
    var hours = double.parse('$h');
    if (selectedGender == Gender.female) {
      res += ((weight * 0.025) + (hours * 0.4)) * 1000;
    } else if (selectedGender == Gender.male) {
      res += ((weight * 0.03) + (hours * 0.5)) * 1000;
    }
    return res.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //const SizedBox(height: 35),
            Text('Płeć', style: TextStyle(fontSize: 18, color: Colors.grey[800])),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    textColor: selectedGender == Gender.female ? Colors.white : Colors.blue,
                    color: selectedGender == Gender.female ? Colors.blue : Colors.white,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0), side: const BorderSide(color: Colors.blue)),
                    child: const Text(' Kobieta ', style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    textColor: selectedGender == Gender.male ? Colors.white : Colors.blue,
                    color: selectedGender == Gender.male ? Colors.blue : Colors.white,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0), side: const BorderSide(color: Colors.blue)),
                    child: const Text('Mężczyzna', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Waga (kg)', style: TextStyle(fontSize: 18, color: Colors.grey[800])),
            const SizedBox(height: 10),
            CustomInput(controller: weightController),
            const SizedBox(height: 20),
            Text('Aktywność fizyczna (godziny/dzień)', style: TextStyle(fontSize: 18, color: Colors.grey[800])),
            const SizedBox(height: 10),
            CustomInput(controller: activityController),
            const SizedBox(height: 210),
            MaterialButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('Uwaga', style: TextStyle(fontSize: 20, color: Colors.grey[800])),
                  content: Text(
                      'Czy chcesz pozostawić domyślne spożycie wody (1800 ml) '
                      'czy chcesz, aby aplikacja obliczała '
                      'spożycie wody na podstawie twojej wagi i aktywności fizycznej?',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        waterAmount = '1800';
                      },
                      child: const Text('Pozostaw jako domyślny', style: TextStyle(fontSize: 18)),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (context) => HydrationScreen()),
                        // );
                        Navigator.pop(context);
                        waterAmount = countWaterAmount(weightController.text, activityController.text);
                        renewItem();
                      },
                      child: const Text('Oblicz ilość wody', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(15),
              color: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
              child: const Text('Zapisz', style: TextStyle(fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}
