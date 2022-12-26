import 'dart:convert';

import 'package:aquascape_mobile/model/food_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../../utils/utils.dart';

class DashboardFishFeeder extends StatefulWidget {
  const DashboardFishFeeder({super.key});

  @override
  State<DashboardFishFeeder> createState() => _DashboardFishFeeder();
}

class _DashboardFishFeeder extends State<DashboardFishFeeder> {
  String url = 'https://aquascapebackend-tdfkwdj56a-et.a.run.app/lamp';
  String? stringResponse;
  var mapResponse;
  var dataResponse;
  bool _switch = true;
  bool _newvalue = false;
  String _status = "";
  late Future<Food> futureFood;

  Future<Food> DataFood() async {
    print('Data Food');
    http.Response response;
    response = await http.get(
        Uri.parse('https://aquascapebackend-tdfkwdj56a-et.a.run.app/feed'));

    var res = jsonDecode(response.body);
    //print(res['status']);
    if (response.statusCode == 200) {
      setState(() {
        _switch = res['status'];
      });
      return Food.fromJson(res);
    } else {
      throw Exception("failed to get status");
    }
    // return true;
  }

  Future putDataTrue() async {
    try {
      print('putDataTrue');
      final response = await http.get(Uri.parse(url + '/true'));
      final json = '{"status": true}';
      // print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.statusCode);
        setState(() {
          _switch = true;
        });
      } else {
        _status = "Gagal";
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future putDataFalse() async {
    try {
      print('putDataFalse');
      final response = await http.get(Uri.parse(url + '/false'));
      final json = '{"status": false}';
      // print(response.statusCode);
      if (response.statusCode == 200) {
        _status = "Mati";
        setState(() {
          _switch = !_switch;
        });
        print(_switch);
      } else {
        _status = "gagal";
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    futureFood = DataFood();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: _switch ? _light : _dark,
      home: Scaffold(
        appBar: CustomAppBar(
          title: ('Dasboard'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                fit: BoxFit.fill,
                _switch ? 'assets/images/food.png' : 'assets/images/tray.png',
                height: 250,
              ),
              Switch(
                  value: _switch,
                  onChanged: (value) {
                    // setState(() {
                    //   _switch = value;
                    //   print(_switch);
                    // });
                    print(value);
                    if (_switch == true) {
                      putDataFalse();
                      Fluttertoast.showToast(
                          msg: "OFF",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      putDataTrue();
                      Fluttertoast.showToast(
                          msg: "ON",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
