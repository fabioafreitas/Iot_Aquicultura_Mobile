import 'package:flutter/material.dart';

class SliderChartCard extends StatefulWidget {
  const SliderChartCard({Key? key}) : super(key: key);

  @override
  _SliderChartCardState createState() => _SliderChartCardState();
}

class _SliderChartCardState extends State<SliderChartCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: SizedBox(
          child: Image.asset('assets/shrimp/shrimp_outlined.png'),
          height: 64,
          width: 64,
        ),
        title: Text('Three-line ListTile'),
        subtitle: Text('A sufficiently long subtitle warrants three lines.'),
        trailing: Icon(Icons.more_vert),
        isThreeLine: true,
      ),
    );
  }
}
