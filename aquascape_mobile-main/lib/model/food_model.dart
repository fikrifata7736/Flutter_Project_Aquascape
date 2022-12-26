import 'package:flutter/material.dart';

class Food {
  final String on;
  final String off;

  Food({required this.on, required this.off});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      on: json['on'],
      off: json['off'],
    );
  }
}
