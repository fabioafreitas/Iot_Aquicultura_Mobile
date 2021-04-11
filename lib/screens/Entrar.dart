import 'package:flutter/material.dart';
import 'package:fundamentos_app/components/Credentials.dart';

class Entrar extends StatefulWidget {
  @override
  _EntrarState createState() => _EntrarState();
}

class _EntrarState extends State<Entrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Entrar'),
        ),
        body: Column(
          children: [
            Credentials(
              buttonName: 'Entrar',
            ),
          ],
        ));
  }
}
