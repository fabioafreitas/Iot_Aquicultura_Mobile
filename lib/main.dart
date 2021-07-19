import 'package:flutter/material.dart';
import 'package:iotaquicultura/logic/Constants.dart';
import 'package:iotaquicultura/logic/DojotDevices.dart';
import 'package:iotaquicultura/screens/main_content_screens/Dashboard.dart';
import 'dart:async';

//Screens
import 'package:iotaquicultura/screens/MainContent.dart';
import 'package:iotaquicultura/screens/TodasAsTelas.dart';
import 'package:iotaquicultura/screens/main_content_screens/Configuration.dart';
import 'package:iotaquicultura/screens/main_content_screens/Sensors.dart';
import 'package:iotaquicultura/screens/Login.dart';
import 'package:iotaquicultura/screens/SignIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Timer _timer = new Timer(const Duration(milliseconds: 20000), () {});

  generateNewDataValue() {
    _timer = new Timer(const Duration(milliseconds: 20000), () {
      setState(() {
        DojotDevices.temperature.add(doubleInRange(
          DojotDevices.rng,
          Temperature.min,
          Temperature.max,
        ));
        DojotDevices.temperature.removeAt(0);

        DojotDevices.ph.add(doubleInRange(
          DojotDevices.rng,
          PH.min,
          PH.max,
        ));
        DojotDevices.ph.removeAt(0);

        DojotDevices.oxygen.add(doubleInRange(
          DojotDevices.rng,
          Oxygen.min,
          Oxygen.max,
        ));
        DojotDevices.oxygen.removeAt(0);

        DojotDevices.conductivity.add(doubleInRange(
          DojotDevices.rng,
          Conductivity.min,
          Conductivity.max,
        ));
        DojotDevices.conductivity.removeAt(0);

        DojotDevices.time.add(DateTime.now().toUtc().toString());
        DojotDevices.time.removeAt(0);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    generateNewDataValue();
    return MaterialApp(
      home: Dashboard(),
      routes: {
        '/dashboard': (context) => Dashboard(),
        '/todasastelas': (context) => TodasAsTelas(),
        '/configuration': (context) => Configuration(),
        '/sensors': (context) => Sensors(),
        '/login': (context) => Login(),
        '/signin': (context) => SignIn(),
        '/maincontent': (context) => MainContent(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
