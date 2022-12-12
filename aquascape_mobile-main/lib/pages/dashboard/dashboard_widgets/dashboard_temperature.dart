import 'package:aquascape_mobile/model/temperature_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '';
import '../../../utils/utils.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

class DashboardTemperature extends StatefulWidget {
  const DashboardTemperature({Key? key}) : super(key: key);

  @override
  State<DashboardTemperature> createState() => _DashboardTemperatureState();
}

class _DashboardTemperatureState extends State<DashboardTemperature> {
  List<TemperatureData> data = [
    TemperatureData('senin', 9),
    TemperatureData('selasa', 10),
    TemperatureData('rabu', 11),
    TemperatureData('kamis', 12),
    TemperatureData('jumat', 13),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temperature Data"),
        centerTitle: true,
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      body: Container(
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(text: 'Temperature Data'),
          legend: Legend(
            isVisible: true,
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<TemperatureData, String>>[
            LineSeries(
              dataSource: data,
              xValueMapper: (TemperatureData jam, _) => jam.hari,
              yValueMapper: (TemperatureData jam, _) => jam.jam,
              name: 'Temperature Data',
              dataLabelSettings: DataLabelSettings(isVisible: true),
            ),
          ],
        ),
      ),
    );
  }
}
