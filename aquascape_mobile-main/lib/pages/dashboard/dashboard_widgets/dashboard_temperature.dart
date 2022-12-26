import 'dart:convert';

import 'package:aquascape_mobile/model/temperature_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '';
import '../../../utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/circular_percent_indicator.dart';

class DashboardTemperature extends StatefulWidget {
  const DashboardTemperature({Key? key}) : super(key: key);

  @override
  State<DashboardTemperature> createState() => _DashboardTemperatureState();
}

class _DashboardTemperatureState extends State<DashboardTemperature> {
  List<Temp> temps = [];
  // List<TemperatureData> data = [
  //   TemperatureData('senin', 9),
  //   TemperatureData('selasa', 10),
  //   TemperatureData('rabu', 11),
  //   TemperatureData('kamis', 12),
  //   TemperatureData('jumat', 13),
  // ];
  void getData() async {
    // print('Data Lampu');
    http.Response response;
    response = await http.get(Uri.parse(
        'https://aquascapebackend-tdfkwdj56a-et.a.run.app/temp/data'));

    var res = jsonDecode(response.body);
    // print(res);
    for (Map<String, dynamic> i in res) {
      temps.add(Temp.fromJson(i));
      print(i);
    }
    temps.forEach((element) {
      print(element.value);
    });

    // List<Temp> tempdata = tempFromJson(res);
    // print(tempdata);

    // setState(() {
    //   temps = tempdata;
    // });
    // return true;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print(Temp);
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
          series: <ChartSeries>[
            LineSeries<Temp, String>(
              dataSource: temps,
              xValueMapper: (Temp temp, _) => temp.time,
              yValueMapper: (Temp temp, _) => temp.value,
              name: 'Temperature Data',
              dataLabelSettings: DataLabelSettings(isVisible: true),
            ),
          ],
        ),
      ),
    );
  }
}
