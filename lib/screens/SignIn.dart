import 'package:flutter/material.dart';
import 'package:iotaquicultura/components/credentials/ButtonCustom.dart';
import 'package:iotaquicultura/components/credentials/InputCustom.dart';
import 'package:iotaquicultura/components/credentials/TextButtonCustom.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            SizedBox(
              child: Image.asset('assets/logo/peixe512inverted.png'),
              height: 256,
              width: 256,
            ),
            InputCustom(inputName: 'Email', inputIcon: Icons.email),
            InputCustom(inputName: 'Senha', inputIcon: Icons.lock),
            InputCustom(inputName: 'Confirmar Senha', inputIcon: Icons.lock),
            const SizedBox(height: 30),
            ButtonCustom(buttonName: 'Cadastrar-se', navigationRoute: '/login'),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 42),
        child: TextButtonCustom(
          textMessage: 'Já tem uma conta?',
          textButton: 'Entrar',
          navigationRoute: '/login',
        ),
      ),
    );
  }
}
