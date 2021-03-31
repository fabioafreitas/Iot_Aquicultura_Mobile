import 'package:flutter/material.dart';
import 'package:fundamentos_app/screen/Entrar.dart';
import 'package:fundamentos_app/screen/Cadastro.dart';
import 'package:fundamentos_app/screen/PrimeiroAcesso.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => PrimeiroAcesso(),
        '/entrar': (context) => Entrar(),
        '/cadastro': (context) => Cadastro(),
      },
    );
  }
}
