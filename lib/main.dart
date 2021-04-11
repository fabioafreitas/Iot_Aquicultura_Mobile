import 'package:flutter/material.dart';

//Screens
import 'package:fundamentos_app/screens/Entrar.dart';
import 'package:fundamentos_app/screens/Cadastro.dart';
import 'package:fundamentos_app/screens/PrimeiroAcesso.dart';
import 'package:fundamentos_app/screens/Sensores.dart';
import 'package:fundamentos_app/screens/Dashboard.dart';

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
      home: PrimeiroAcesso(),
      routes: {
        '/primeiroacesso': (context) => PrimeiroAcesso(),
        '/entrar': (context) => Entrar(),
        '/cadastro': (context) => Cadastro(),
        '/sensores': (context) => Sensores(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}
