import 'package:flutter/material.dart';

class Fan {
  final bool status;

  const Fan({required this.status});

  factory Fan.fromJson(Map<String, dynamic> json) {
    return Fan(
      status: json['Status'],
    );
  }
}
