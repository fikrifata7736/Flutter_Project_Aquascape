import 'dart:convert';

import 'package:flutter/material.dart';

class fetchData {
  final bool status;

  fetchData({required this.status});

  factory fetchData.fromJson(Map<String, dynamic> json) {
    return fetchData(
      status: json['status'],
    );
  }
}
