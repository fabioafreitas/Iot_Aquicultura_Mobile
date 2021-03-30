import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fundamentos_app/components/SocialNetworkButtons.dart';

class PrimeiroAcesso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(bottom: 128),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: FaIcon(
                FontAwesomeIcons.timesCircle,
                size: 170,
              ),
              padding: EdgeInsets.only(bottom: 64),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.fromLTRB(64, 0, 64, 0),
              child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: ElevatedButton(
                      onPressed: () {}, child: Text('Registrar-se'))),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.fromLTRB(64, 0, 64, 64),
              child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child:
                      ElevatedButton(onPressed: () {}, child: Text('Entrar'))),
            ),
            SocialNetworkButtons(),
          ],
        ),
      ),
    );
  }
}
