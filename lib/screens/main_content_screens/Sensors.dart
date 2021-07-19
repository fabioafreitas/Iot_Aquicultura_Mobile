import 'package:flutter/material.dart';
import 'package:iotaquicultura/components/visual/SensorCard.dart';
import 'package:iotaquicultura/logic/Constants.dart';
import 'package:iotaquicultura/logic/DojotDevices.dart';

enum TabTypes { tanque, temperatura, ph, oxigenio, condutividade }

class Sensors extends StatefulWidget {
  const Sensors({Key? key}) : super(key: key);

  @override
  _SensorsState createState() => _SensorsState();
}

class _SensorsState extends State<Sensors> {
  @override
  Widget build(BuildContext context) {
    var ultimaTemperatura = DojotDevices.temperature.last;
    var penultimaTemperatura =
        DojotDevices.temperature[DojotDevices.temperature.length - 2];

    var ultimaPh = DojotDevices.ph.last;
    var penultimaPh = DojotDevices.ph[DojotDevices.ph.length - 2];

    var ultimaOxigenio = DojotDevices.oxygen.last;
    var penultimaOxigenio = DojotDevices.oxygen[DojotDevices.oxygen.length - 2];

    var ultimaCondutividade = DojotDevices.conductivity.last;
    var penultimaCondutividade =
        DojotDevices.conductivity[DojotDevices.conductivity.length - 2];

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          // leading: Icon(Icons.person_outline),
          title: Text('Sensores'),
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.white.withOpacity(0.3),
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text('Tanques'),
              ),
              Tab(
                child: Text('Temperatura'),
              ),
              Tab(
                child: Text('pH'),
              ),
              Tab(
                child: Text('Condutividade'),
              ),
              Tab(
                child: Text('Oxigênio Dissolvido'),
              ),
            ],
          ),
          // actions: <Widget>[
          //   Padding(
          //     padding: const EdgeInsets.only(right: 16.0),
          //     child: Icon(Icons.add_alert),
          //   ),
          // ],
        ),
        body: TabBarView(
          children: <Widget>[
            _renderListOfTanks(DojotDevices.time.last),
            _renderListOfSensors(
              'Temperatura',
              DojotDevices.time.last,
              ultimaTemperatura,
              penultimaTemperatura,
            ),
            _renderListOfSensors(
              'pH',
              DojotDevices.time.last,
              ultimaPh,
              penultimaPh,
            ),
            _renderListOfSensors(
              'Condutividade',
              DojotDevices.time.last,
              ultimaCondutividade,
              penultimaCondutividade,
            ),
            _renderListOfSensors(
              'Oxigênio Dissolvido',
              DojotDevices.time.last,
              ultimaOxigenio,
              penultimaOxigenio,
            ),
          ],
        ),
      ),
    );
  }

  //recebe o nome da aba e renderiza um tanque ou o respectivo parâmetro
  Widget _renderListOfSensors(
      parameterName, readingTime, ultimaLeitura, penultimaLeitura) {
    return ListView.builder(
      itemCount: DojotDevices.device_ids.length,
      itemBuilder: (BuildContext context, int index) {
        var item = DojotDevices.device_ids[index];
        var animalName = 'Litopenaeus vannamei';
        var tankId = item['id'];
        if (item['animal'] == 'fish') {
          animalName = 'Tilápia rendali';
        }

        bool isIncreasing = false;
        if (penultimaLeitura > ultimaLeitura) {
          isIncreasing = true;
        }

        bool isOutOfRange = false;
        var paramValue = '';
        var imageName = '';
        if (parameterName == 'Temperatura') {
          if (ultimaLeitura > Temperature.max ||
              ultimaLeitura < Temperature.min) {
            isOutOfRange = true;
          }
          paramValue = ultimaLeitura.toStringAsFixed(2) + ' °C';
          imageName = 'temperature';
        } else if (parameterName == 'Condutividade') {
          if (ultimaLeitura > Conductivity.max ||
              ultimaLeitura < Conductivity.min) {
            isOutOfRange = true;
          }
          paramValue = ultimaLeitura.toStringAsFixed(2) + ' μS/cm';
          imageName = 'electricity';
        } else if (parameterName == 'pH') {
          if (ultimaLeitura > PH.max || ultimaLeitura < PH.min) {
            isOutOfRange = true;
          }
          paramValue = ultimaLeitura.toStringAsFixed(3);
          imageName = 'ph';
        } else {
          if (ultimaLeitura > Oxygen.max || ultimaLeitura < Oxygen.min) {
            isOutOfRange = true;
          }
          paramValue = ultimaLeitura.toStringAsFixed(2) + ' mg/L';
          imageName = 'oxygen';
        }

        return new SensorCard(
          pictureName:
              'assets/' + imageName + '/' + imageName + '_color_outlined.png',
          cardTitle: parameterName + ' do tanque ' + (tankId as String),
          cardSubtitle: 'Cultura de ' + animalName,
          timeLastReading: readingTime,
          isOutOfRange: isOutOfRange,
          isIncreasing: isIncreasing,
          isSensor: true,
          paramValue: paramValue,
          onTap: () {},
        );
      },
    );
  }

  Widget _renderListOfTanks(readingTime) {
    return ListView.builder(
      itemCount: DojotDevices.device_ids.length,
      itemBuilder: (BuildContext context, int index) {
        var item = DojotDevices.device_ids[index];
        var imageName = 'shrimp';
        var animalName = 'Litopenaeus vannamei';
        var tankId = item['id'];
        if (item['animal'] == 'fish') {
          imageName = 'fish';
          animalName = 'Tilápia rendali';
        }

        return new SensorCard(
          pictureName:
              'assets/' + imageName + '/' + imageName + '_color_outlined.png',
          cardTitle: 'Tanque ' + (tankId as String),
          cardSubtitle: 'Cultura de ' + animalName,
          timeLastReading: readingTime,
          isOutOfRange: true,
          isSensor: false,
          onTap: () {},
        );
      },
    );
  }
}
