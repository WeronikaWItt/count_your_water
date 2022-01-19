import 'dart:js';

import 'package:count_your_water/notifiers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {

  runApp(
      ChangeNotifierProvider(
        builder: (context)=>DataNotifier(),
        child: App(),
      ),
      );
}
