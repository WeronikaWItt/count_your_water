import 'package:flutter/material.dart';

enum Gender {
  male,
  female,
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Gender selectedGender = Gender.female;
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Płeć'),
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
                    child: const Text('Kobieta'),
                  ),
                ),
                const SizedBox(width: 30),
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
                    child: const Text('Mężczyzna'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Waga (kg)'),
            const SizedBox(height: 5),
            TextField(
              keyboardType: TextInputType.number,
              controller: weightController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  )),
            ),
            const SizedBox(height: 10),
            const Text('Wiek'),
            const SizedBox(height: 5),
            TextField(
              keyboardType: TextInputType.number,
              controller: heightController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
