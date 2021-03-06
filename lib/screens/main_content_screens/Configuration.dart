import 'package:flutter/material.dart';
import 'package:iotaquicultura/components/credentials/ButtonCustom.dart';
import 'package:iotaquicultura/components/credentials/InputCustom.dart';
import 'package:iotaquicultura/components/visual/ConnectionStatusIcon.dart';
import 'package:iotaquicultura/negocio/ConnectionStatus.dart';

// stores ExpansionPanel state information
class _ItemCustom {
  _ItemCustom({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  Widget expandedValue;
  String headerValue;
  bool isExpanded;
}

Widget _buildDojotConfiguration() {
  return Column(
    children: [
      ConnectionStatusIcon(connStatus: ConnectionStatus.dojot_conectado),
      const SizedBox(height: 15),
      InputCustom(
          inputName: 'Endereço do Servidor Dojot', inputIcon: Icons.domain),
      InputCustom(inputName: 'Nome de Usuário', inputIcon: Icons.person),
      InputCustom(inputName: 'Senha', inputIcon: Icons.lock),
      const SizedBox(height: 30),
      ButtonCustom(buttonName: 'Conectar', navigationRoute: '/sensors'),
    ],
  );
}

Widget _buildLoginConfiguration() {
  return ListTile(
    title: Text('email@email.com'),
    subtitle: const Text('Clique no botão à direita para sair da conta'),
    trailing: const Icon(Icons.logout),
    onTap: () => {},
  );
}

Widget _buildIconAttribution() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('https://www.flaticon.com/free-icon/ph_4236740'),
      Text('https://www.flaticon.com/premium-icon/shrimp_3071131'),
      Text('https://www.flaticon.com/free-icon/plugin_2781868'),
      Text('https://www.flaticon.com/free-icon/thermometer_2426703'),
      Text('https://www.flaticon.com/premium-icon/fish_3347354'),
      Text('https://www.flaticon.com/free-icon/oxygen-tank_421266'),
      Text('https://www.flaticon.com/premium-icon/high-temperature_1585441'),
      const SizedBox(height: 15),
    ],
  );
}

class ServerStatusIcon extends StatefulWidget {
  const ServerStatusIcon({Key? key}) : super(key: key);

  @override
  _ServerStatusIconState createState() => _ServerStatusIconState();
}

class _ServerStatusIconState extends State<ServerStatusIcon> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}

class Configuration extends StatefulWidget {
  const Configuration({Key? key}) : super(key: key);

  @override
  _ConfigurationState createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  final List<_ItemCustom> _itemCustomList = [
    _ItemCustom(
      headerValue: 'Servidor Dojot',
      expandedValue: _buildDojotConfiguration(),
      isExpanded: false,
    ),
    _ItemCustom(
      headerValue: 'Login Atual',
      expandedValue: _buildLoginConfiguration(),
      isExpanded: false,
    ),
    _ItemCustom(
      headerValue: 'Atribuição Ícones',
      expandedValue: _buildIconAttribution(),
      isExpanded: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Configurações"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          _buildPanel(),
        ],
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _itemCustomList[index].isExpanded = !isExpanded;
        });
      },
      children: _itemCustomList.map<ExpansionPanel>((_ItemCustom item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: item.expandedValue,
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
