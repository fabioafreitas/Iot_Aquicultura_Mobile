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
      home: Navigator(
        pages: [
          MaterialPage(child: PrimeiroAcesso()),
          MaterialPage(child: Cadastro()),
          MaterialPage(child: Entrar()),
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
