import 'package:flutter/material.dart';

class SensorCard extends StatefulWidget {
  var pictureName;
  var cardTitle;
  var cardSubtitle;
  bool isFavorite;

  SensorCard(
      {Key? key,
      @required this.pictureName,
      @required this.cardTitle,
      @required this.cardSubtitle,
      this.isFavorite: false})
      : super(key: key);

  @override
  _SensorCardState createState() => _SensorCardState();
}

class _SensorCardState extends State<SensorCard> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.1;
    double paddingValue = 20;
    return InkWell(
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                child: Image.asset(widget.pictureName),
                height: size,
                width: size,
              ),
              title: Text(widget.cardTitle),
              subtitle: Text(widget.cardSubtitle),
              trailing: InkWell(
                child:
                    Icon(widget.isFavorite ? Icons.star : Icons.star_outline),
                onTap: () => {
                  setState(() {
                    widget.isFavorite = !widget.isFavorite;
                  })
                },
              ),
              isThreeLine: true,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  paddingValue, 0, paddingValue, paddingValue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statusParam(),
                  _valueParam(),
                  _timeLastReading(),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () => {},
    );
  }
}

Widget _statusParam() {
  var color = Colors.yellow[700];
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 3),
        child: Icon(
          Icons.circle,
          color: color,
          size: 15,
        ),
      ),
      Text(
        'Alerta',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    ],
  );
}

Widget _valueParam() {
  return Row(
    children: [
      Text(
        '12.279 °C',
        style: TextStyle(color: Colors.grey),
      )
    ],
  );
}

Widget _timeLastReading() {
  return Row(
    children: [
      Text(
        '5 minutos atrás',
        style: TextStyle(color: Colors.grey),
      )
    ],
  );
}
