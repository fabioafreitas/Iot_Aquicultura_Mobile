import 'package:flutter/material.dart';

//Screens
import 'package:iotaquicultura/screens/MainContent.dart';
import 'package:iotaquicultura/screens/TodasAsTelas.dart';
import 'package:iotaquicultura/screens/main_content_screens/Configuration.dart';
import 'package:iotaquicultura/screens/main_content_screens/Sensors.dart';
import 'package:iotaquicultura/screens/main_content_screens/Dashboard.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodasAsTelas(),
      routes: {
        '/todasastelas': (context) => TodasAsTelas(),
        '/configuration': (context) => Configuration(),
        '/sensors': (context) => Sensors(),
        '/dashboard': (context) => Dashboard(),
        '/login': (context) => Login(),
        '/signin': (context) => SignIn(),
        '/maincontent': (context) => MainContent(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
