import 'package:flutter/material.dart';
import 'package:iotaquicultura/components/visual/SensorCard.dart';
import 'package:iotaquicultura/components/visual/SliderChartCard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

// SizedBox(
// width: MediaQuery.of(context).size.width * 0.5,
// height: MediaQuery.of(context).size.height * 0.5,
// child: Text('teste') //PieOutsideLabelChart.withSampleData(),
// )

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dashboard'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            SensorCard(
              pictureName: 'assets/shrimp/shrimp_color_outlined.png',
              cardTitle: 'Tanque com Camarões',
              cardSubtitle: 'Tanque T201',
            ),
            SensorCard(
              pictureName: 'assets/shrimp/shrimp_color_outlined.png',
              cardTitle: 'Tanque com Camarões',
              cardSubtitle: 'Tanque T201',
            ),
            SensorCard(
              pictureName: 'assets/shrimp/shrimp_color_outlined.png',
              cardTitle: 'Tanque com Camarões',
              cardSubtitle: 'Tanque T201',
            ),
          ],
        ),
      ),
    );
  }
}
