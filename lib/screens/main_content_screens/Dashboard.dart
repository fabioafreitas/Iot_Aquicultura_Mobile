import 'package:flutter/material.dart';
import 'package:iotaquicultura/logic/Constants.dart';
import 'package:iotaquicultura/logic/DojotDevices.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<ChartData> _chartData;

  @override
  void initState() {
    _chartData = [
      ChartData(2000, 12),
      ChartData(2001, 14),
      ChartData(2002, 11),
      ChartData(2003, 10),
      ChartData(2004, 14),
      ChartData(2005, 13),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width - 24;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _cardGauge(screenWidth, 'Temperatura'),
                _cardGauge(screenWidth, 'pH'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _cardGauge(screenWidth, 'Condutividade'),
                _cardGauge(screenWidth, 'Oxigênio Dissolvido'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: _cardLineChart(screenWidth, 'Temperatura'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: _cardLineChart(screenWidth, 'pH'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: _cardLineChart(screenWidth, 'Condutividade'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: _cardLineChart(screenWidth, 'Oxigênio Dissolvido'),
          ),
        ],
      ),
    );
  }

  Widget _cardLineChart(screenWidth, parameterName) {
    String metricName = '';
    if (parameterName == 'Temperatura') {
      metricName = 'temperatura (°C)';
    } else if (parameterName == 'Condutividade') {
      metricName = 'condutividade (μS/cm)';
    } else if (parameterName == 'pH') {
      metricName = 'pH';
    } else {
      metricName = 'oxigenio dissolvido (mg/L)';
    }

    return SizedBox(
      child: Card(
        elevation: 3,
        child: SfCartesianChart(
          title: ChartTitle(text: parameterName),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries>[
            LineSeries<ChartData, double>(
              name: metricName,
              dataSource: _chartData,
              xValueMapper: (ChartData sales, _) => sales.year,
              yValueMapper: (ChartData sales, _) => sales.sales,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true,
            ),
          ],
          primaryXAxis: NumericAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
          ),
        ),
      ),
      width: screenWidth,
      height: 350,
    );
  }

  Widget _cardGauge(screenWidth, parameterName) {
    int minDefaultValue = 0;
    int maxDefaultValue = 0;
    int currentValue = 0;
    int minValue = 0;
    int maxValue = 0;
    if (parameterName == 'Temperatura') {
      minDefaultValue = Temperature.min.toInt();
      maxDefaultValue = Temperature.max.toInt();
      currentValue = DojotDevices.temperature.last.toInt();
      double percentage = 0.25;
      minValue = (minDefaultValue - (minDefaultValue * percentage)).toInt();
      maxValue = (maxDefaultValue + (minDefaultValue * percentage)).toInt();
    } else if (parameterName == 'Condutividade') {
      minDefaultValue = Conductivity.min.toInt();
      maxDefaultValue = Conductivity.max.toInt();
      currentValue = DojotDevices.conductivity.last.toInt();
      double percentage = 0.05;
      minValue = (minDefaultValue - (minDefaultValue * percentage)).toInt();
      maxValue = (maxDefaultValue + (minDefaultValue * percentage)).toInt();
    } else if (parameterName == 'pH') {
      minDefaultValue = PH.min.toInt();
      maxDefaultValue = PH.max.toInt();
      currentValue = DojotDevices.ph.last.toInt();
      minValue = 5;
      maxValue = 9;
    } else {
      minDefaultValue = Oxygen.min.toInt();
      maxDefaultValue = Oxygen.max.toInt();
      currentValue = DojotDevices.oxygen.last.toInt();
      minValue = 5;
      maxValue = 9;
    }

    return SizedBox(
      child: Card(
        elevation: 3,
        child: _gaugeRadial(
          minValue,
          minDefaultValue,
          maxDefaultValue,
          maxValue,
          currentValue,
          parameterName,
        ),
      ),
      width: screenWidth / 2,
      height: 200,
    );
  }

  Widget _gaugeRadial(minValue, minDefaultValue, maxDefaultValue, maxValue,
      currentValue, parameterName) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            startAngle: 180,
            endAngle: 0,
            minimum: minValue,
            maximum: maxValue,
            ranges: <GaugeRange>[
              GaugeRange(
                  startValue: minValue,
                  endValue: minDefaultValue,
                  color: Colors.red),
              GaugeRange(
                  startValue: minDefaultValue,
                  endValue: maxDefaultValue,
                  color: Colors.green),
              GaugeRange(
                  startValue: maxDefaultValue,
                  endValue: maxValue,
                  color: Colors.red)
            ],
            pointers: <GaugePointer>[NeedlePointer(value: currentValue)],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Container(
                      child: Text(
                    parameterName,
                  )),
                  angle: 90,
                  positionFactor: 0.5)
            ],
          )
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.year, this.sales);
  final double year;
  final double sales;
}
