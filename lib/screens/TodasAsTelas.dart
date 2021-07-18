import 'package:flutter/material.dart';

class TodasAsTelas extends StatelessWidget {
  var rotas = [
    'Dashboard',
    'Configuration',
    'Sensors',
    'Login',
    'SignIn',
    'MainContent',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rotas
              .map((rota) => ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, ('/' + rota).toLowerCase()),
                  child: Text(rota)))
              .toList(),
        ),
      ),
    );
  }
}
