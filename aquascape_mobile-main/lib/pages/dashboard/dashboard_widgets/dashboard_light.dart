import 'dart:convert';
import 'package:aquascape_mobile/model/light_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../../utils/utils.dart';

class DashboardLight extends StatefulWidget {
  const DashboardLight({super.key});

  @override
  State<DashboardLight> createState() => _DashboardLightState();
}

class _DashboardLightState extends State<DashboardLight> {
  String url = 'https://aquascape-project-tdfkwdj56a-et.a.run.app/Lamp';
  String? stringResponse;
  var mapResponse;
  var dataResponse;
  bool _switch = true;
  bool _newvalue = false;
  String _status = "";
  late Future<Lamp> futureLamp;

  Future<Lamp> DataLampu() async {
    print('Data Lampu');
    http.Response response;
    response = await http.get(
        Uri.parse('https://aquascape-project-tdfkwdj56a-et.a.run.app/Lamp'));

    var res = jsonDecode(response.body);
    //print(res['status']);
    if (response.statusCode == 200) {
      setState(() {
        _switch = res['status'];
      });
      return Lamp.fromJson(res);
    } else {
      throw Exception("failed to get status");
    }
    // return true;
  }

  Future putDataTrue() async {
    try {
      print('putDataTrue');
      final response = await http.put(Uri.parse(url + '/UpdateLampTrue'));
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
      final response = await http.put(Uri.parse(url + '/UpdateLampFalse'));
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
    futureLamp = DataLampu();
  }

  // ThemeData _dark =
  //     ThemeData(brightness: Brightness.dark, primaryColor: Colors.white);
  // ThemeData _light =
  //     ThemeData(brightness: Brightness.light, primaryColor: Colors.black);
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
                _switch ? 'assets/images/on.png' : 'assets/images/off.png',
                height: 250,
              ),
              Switch(
                  value: _switch,
                  onChanged: (value) {
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

// class Lamp {
//   final String on;
//   final String off;

//   Lamp({required this.on, required this.off});

//   factory Lamp.fromJson(Map<String, dynamic> json) {
//     return Lamp(
//       on: json['on'],
//       off: json['off'],
//     );
//   }
// }
