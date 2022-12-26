import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

List<Sensor> tempFromJson(String str) =>
    List<Sensor>.from(json.decode(str).map((x) => Sensor.fromJson(x)));
String tempToJson(List<Sensor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sensor {
  final String time;
  final num value;

  Sensor({required this.time, required this.value});

  factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(time: json['time'], value: int.parse(json['value']));
  }

  Map<String, dynamic> toJson() => {
        "time": time,
        "value": value,
      };
}
