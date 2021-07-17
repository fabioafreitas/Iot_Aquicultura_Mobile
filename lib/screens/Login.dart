import 'package:flutter/material.dart';
import 'package:iotaquicultura/components/credenciais/ButtonCustom.dart';
import 'package:iotaquicultura/components/credenciais/InputCustom.dart';
import 'package:iotaquicultura/components/credenciais/TextButtonCustom.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            SizedBox(
              child: Image.asset('assets/peixe512inverted.png'),
              height: 256,
              width: 256,
            ),
            InputCustom(inputName: 'Email', inputIcon: Icons.email),
            InputCustom(inputName: 'Senha', inputIcon: Icons.lock),
            const SizedBox(height: 30),
            ButtonCustom(
                buttonName: 'Entrar', navigationRoute: '/cardsdisplay'),
            TextButtonCustom(
              textMessage: 'Esqueceu sua senha?',
              textButton: 'Recupere-a',
              navigationRoute: '/signin',
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 42),
        child: TextButtonCustom(
          textMessage: 'Não tem uma conta?',
          textButton: 'Cadastre-se',
          navigationRoute: '/signin',
        ),
      ),
    );
  }
}
