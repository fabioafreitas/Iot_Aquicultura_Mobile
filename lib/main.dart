import 'package:flutter/material.dart';
import 'package:iotaquicultura/negocio/constants/ParamConstants.dart';
import 'package:iotaquicultura/negocio/DojotDevices.dart';
import 'package:iotaquicultura/negocio/http/Requests.dart';
import 'package:iotaquicultura/negocio/models/JwtModel.dart';
import 'dart:async';

//Screens
import 'package:iotaquicultura/screens/main_content_screens/Dashboard.dart';
import 'package:iotaquicultura/screens/main_content_screens/Configuration.dart';
import 'package:iotaquicultura/screens/main_content_screens/Sensors.dart';
import 'package:iotaquicultura/screens/MainContent.dart';
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
  Timer _timer = new Timer(const Duration(milliseconds: 5000), () {});

  generateNewDataValue() {
    _timer = new Timer(const Duration(milliseconds: 5000), () {
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
      home: TodasAsTelas(),
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

class TodasAsTelas extends StatefulWidget {
  @override
  _TodasAsTelasState createState() => _TodasAsTelasState();
}

class _TodasAsTelasState extends State<TodasAsTelas> {
  var rotas = [
    'Configuration',
    'Sensors',
    'Login',
    'SignIn',
    'MainContent',
    'Dashboard',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: rotas
                  .map((rota) => ElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                          context, ('/' + rota).toLowerCase()),
                      child: Text(rota)))
                  .toList(),
            ),
            Container(
              child: FutureBuilder<JWTModel>(
                future: Requests.getDojotJWT(
                  username: 'admin',
                  password: 'admin',
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final dados = snapshot.data;
                    return Text('JWT: ${dados?.jwt}');
                  } else if (snapshot.hasError) {
                    return Text('Erro na requisição');
                  }
                  return CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
