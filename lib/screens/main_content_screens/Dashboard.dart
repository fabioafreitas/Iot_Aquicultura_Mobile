import 'package:flutter/material.dart';

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
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Dashboard')),
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Column(
          children: [
            Text('Dashboard'),
            Teste(),
            Teste(),
          ],
        )));
  }
}

class Teste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      child: Center(
        child: Text("teste"),
      ),
    );
  }
}
