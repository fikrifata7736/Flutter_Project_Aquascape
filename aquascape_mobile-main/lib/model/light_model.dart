import 'package:flutter/material.dart';

class Lamp {
  final String on;
  final String off;

  Lamp({required this.on, required this.off});

  factory Lamp.fromJson(Map<String, dynamic> json) {
    return Lamp(
      on: json['on'],
      off: json['off'],
    );
  }
}
