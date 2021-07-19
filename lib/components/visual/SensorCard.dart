import 'package:flutter/material.dart';

class SensorCard extends StatefulWidget {
  String pictureName;
  String cardTitle;
  String cardSubtitle;
  String paramValue;
  String timeLastReading;
  bool isIncreasing;
  bool isOutOfRange;
  bool isFavorite;
  bool isSensor; // true = sensor, false = tanque contendo sensores
  var onTap;

  SensorCard({
    Key? key,
    required this.pictureName,
    required this.cardTitle,
    required this.cardSubtitle,
    required this.isOutOfRange,
    required this.timeLastReading,
    required this.isSensor,
    required this.onTap,
    this.paramValue: "",
    this.isIncreasing: false,
    this.isFavorite: false,
  }) : super(key: key);

  @override
  _SensorCardState createState() => _SensorCardState();
}

class _SensorCardState extends State<SensorCard> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.1;
    double paddingRow = 20;
    double paddingCard = 5;
    return InkWell(
      child: Padding(
        padding: EdgeInsets.fromLTRB(paddingCard, paddingCard, paddingCard, 0),
        child: Card(
          elevation: 3,
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
                // trailing: InkWell(
                //   child:
                //       Icon(widget.isFavorite ? Icons.star : Icons.star_outline),
                //   onTap: () => {
                //     setState(() {
                //       widget.isFavorite = !widget.isFavorite;
                //     })
                //   },
                // ),
                isThreeLine: false,
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(paddingRow, 0, paddingRow, paddingRow),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: widget.isSensor
                      ? [
                          _valueParam(widget.paramValue, widget.isIncreasing,
                              widget.isOutOfRange),
                          _timeLastReading(widget.timeLastReading),
                        ]
                      : [
                          _statusParam(widget.isOutOfRange),
                          _timeLastReading(widget.timeLastReading),
                        ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: widget.onTap,
    );
  }
}

Widget _statusParam(isOutOfRange) {
  Color? cor = (isOutOfRange ? Colors.red : Colors.green);
  String? texto = (isOutOfRange ? 'Níveis Incorretos' : 'Níveis Normais');
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 3),
        child: Icon(
          Icons.circle,
          color: cor,
          size: 15,
        ),
      ),
      Text(
        texto,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: cor,
        ),
      ),
    ],
  );
}

Widget _valueParam(value, isIncreasing, isOutOfRange) {
  Color? cor = (isOutOfRange ? Colors.red : Colors.green);
  IconData? icone =
      (isIncreasing ? Icons.arrow_drop_up : Icons.arrow_drop_down);
  return Row(
    children: [
      Text(
        value,
        style: TextStyle(color: cor, fontWeight: FontWeight.bold),
      ),
      Icon(
        icone,
        color: cor,
      )
    ],
  );
}

String _timeLastReadingAuxiliar(time, text) {
  return 'Há ' + time.toString() + (time == 1 ? ' ' + text : ' ' + text + 's');
}

Widget _timeLastReading(String readingTimeString) {
  String timeString = 'Indisponível';
  if (readingTimeString != null) {
    var readingTime = DateTime.parse(readingTimeString);
    var timeDifference = DateTime.now().difference(readingTime);

    if (timeDifference.inSeconds < 60)
      timeString =
          _timeLastReadingAuxiliar(timeDifference.inSeconds, 'segundo');
    else if (timeDifference.inMinutes < 60)
      timeString = _timeLastReadingAuxiliar(timeDifference.inMinutes, 'minuto');
    else if (timeDifference.inHours < 24)
      timeString = _timeLastReadingAuxiliar(timeDifference.inHours, 'hora');
    else
      timeString = _timeLastReadingAuxiliar(timeDifference.inDays, 'dia');
  }
  return Row(
    children: [
      Text(
        timeString,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      )
    ],
  );
}
