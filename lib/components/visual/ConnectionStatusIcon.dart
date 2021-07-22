import 'package:flutter/material.dart';
import 'package:iotaquicultura/negocio/ConnectionStatus.dart';

Widget _iconSelector(ConnectionStatus? status, double iconSize) {
  Icon? icon;
  switch (status) {
    case ConnectionStatus.wifi_conectado:
      icon = Icon(Icons.wifi, size: iconSize);
      break;
    case ConnectionStatus.wifi_desconectado:
      icon = Icon(Icons.wifi_off, size: iconSize);
      break;
    case ConnectionStatus.dojot_conectado:
      icon = Icon(Icons.cloud_done_outlined, size: iconSize);
      break;
    case ConnectionStatus.dojot_desconectado:
      icon = Icon(Icons.cloud_off_outlined, size: iconSize);
      break;
    default:
  }
  return icon as Icon;
}

String _textSelector(ConnectionStatus? status) {
  String text = '';
  switch (status) {
    case ConnectionStatus.wifi_conectado:
      text = 'Wi-Fi Conectado';
      break;
    case ConnectionStatus.wifi_desconectado:
      text = 'Wi-Fi Desconectado';
      break;
    case ConnectionStatus.dojot_conectado:
      text = 'Dojot Conectado';
      break;
    case ConnectionStatus.dojot_desconectado:
      text = 'Dojot Desconectado';
      break;
    default:
  }
  return text;
}

class ConnectionStatusIcon extends StatefulWidget {
  ConnectionStatus? connStatus;

  ConnectionStatusIcon({Key? key, @required this.connStatus}) : super(key: key);

  @override
  _ConnectionStatusIconState createState() => _ConnectionStatusIconState();
}

class _ConnectionStatusIconState extends State<ConnectionStatusIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _iconSelector(widget.connStatus, 64),
        Title(
          color: Colors.black,
          child: Text(_textSelector(widget.connStatus)),
        )
      ],
    );
  }
}
