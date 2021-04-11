import 'package:flutter/material.dart';
import 'package:fundamentos_app/components/Credentials.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Registrar-se'),
        ),
        body: Column(
          children: [
            Credentials(
              buttonName: 'Registrar-se',
            ),
          ],
        ));
  }
}
