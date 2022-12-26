import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

List<Temp> tempFromJson(String str) =>
    List<Temp>.from(json.decode(str).map((x) => Temp.fromJson(x)));
String tempToJson(List<Temp> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Temp {
  final String time;
  final num value;

  Temp({required this.time, required this.value});

  factory Temp.fromJson(Map<String, dynamic> json) {
    return Temp(time: json['time'], value: int.parse(json['value']));
  }

  Map<String, dynamic> toJson() => {
        "time": time,
        "value": value,
      };
}
