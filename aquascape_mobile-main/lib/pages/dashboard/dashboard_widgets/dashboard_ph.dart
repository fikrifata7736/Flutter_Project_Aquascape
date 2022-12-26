import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:aquascape_mobile/model/sensor_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/utils.dart';

class DashboardSensorPH extends StatefulWidget {
  const DashboardSensorPH({super.key});

  @override
  State<DashboardSensorPH> createState() => _DashboardSensorPH();
}

class _DashboardSensorPH extends State<DashboardSensorPH> {
  List<Sensor> sensors = [];
  late ChartSeriesController _chartSeriesController;

  void getData() async {
    // print('Data Lampu');
    http.Response response;
    response = await http.get(Uri.parse(
        'https://aquascapebackend-tdfkwdj56a-et.a.run.app/phscale/data'));

    var res = jsonDecode(response.body);
    // print(res);
    for (Map<String, dynamic> i in res) {
      sensors.add(Sensor.fromJson(i));
      print(i);
    }
    sensors.forEach((element) {
      print(element.value);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    //Timer.periodic(const Duration(seconds: 1), updateDataSource);
  }

  @override
  Widget build(BuildContext context) {
    print(Sensor);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sensor PH Data"),
        centerTitle: true,
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      body: Container(
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(text: 'Sensor PH Data'),
          legend: Legend(
            isVisible: true,
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries>[
            LineSeries<Sensor, String>(
              onRendererCreated: (ChartSeriesController controller) {
                _chartSeriesController = controller;
              },
              dataSource: sensors,
              xValueMapper: (Sensor temp, _) => temp.time,
              yValueMapper: (Sensor temp, _) => temp.value,
              name: 'Temperature Data',
              dataLabelSettings: DataLabelSettings(isVisible: true),
            ),
          ],
        ),
      ),
    );
  }

  // int time = 19;
  // void updateDataSource(Timer timer) {
  //   sensors.add(Sensor(time++, (math.Random().nextInt(60) + 30)));
  //   sensors.removeAt(0);
  //   _chartSeriesController.updateDataSource(
  //       addedDataIndex: sensors.length - 1, removedDataIndex: 0);
  // }
}
