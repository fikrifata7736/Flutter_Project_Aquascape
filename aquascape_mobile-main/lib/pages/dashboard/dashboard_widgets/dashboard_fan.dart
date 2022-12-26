import 'dart:convert';
import 'package:aquascape_mobile/model/fan_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../../utils/utils.dart';

class DashboardFan extends StatefulWidget {
  const DashboardFan({super.key});

  @override
  State<DashboardFan> createState() => _DashboardFanState();
}

class _DashboardFanState extends State<DashboardFan> {
  String url = "https://aquascape-project-tdfkwdj56a-et.a.run.app/Fan";
  String? stringResponse;
  bool _button = true;
  String _status = "";
  late Future<Fan> futureFan;

  Future<Fan> DataFan() async {
    print('Data Fan');
    http.Response response;
    response = await http.get(Uri.parse('url'));

    var res = jsonDecode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        _button = res['status'];
      });
      return Fan.fromJson(res);
    } else {
      throw Exception("failed to get status");
    }
  }

  Future putDataFanTrue() async {
    try {
      print('putDataFanTrue');
      final response = await http.put(Uri.parse(url + '/UpdateFanTrue'));
      final json = '{"status": true}';
      // print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.statusCode);
        setState(() {
          _button = true;
        });
      } else {
        _status = "Gagal";
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future putDataFanFalse() async {
    try {
      print('putDataFanFalse');
      final response = await http.put(Uri.parse(url + '/UpdateFanFalse'));
      final json = '{"status": false}';
      // print(response.statusCode);
      if (response.statusCode == 200) {
        _status = "Mati";
        setState(() {
          _button = !_button;
        });
        //     print(_switch);
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
    futureFan = DataFan();
  }

  ThemeData _dark =
      ThemeData(brightness: Brightness.dark, primaryColor: Colors.white);
  ThemeData _light =
      ThemeData(brightness: Brightness.light, primaryColor: Colors.black);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _button ? _light : _dark,
      home: Scaffold(
        appBar: CustomAppBar(
          title: ('Dasboard'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.mode_fan_off,
                size: 100,
                color: Colors.blueAccent,
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 20,
              ),
              Switch(
                  //button
                  value: _button,
                  onChanged: (value) {
                    print(value);
                    if (_button == true) {
                      putDataFanFalse();
                      Fluttertoast.showToast(
                          msg: "OFF",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      putDataFanTrue();
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

// void _button(BuildContext context) {
//   final Scaffold = ScaffoldMessenger.of(context);
//   Scaffold.showSnackBar(SnackBar(content: const Text('Halo')));
// }

// class Fan {
//   final bool status;

//   const Fan({required this.status});

//   factory Fan.fromJson(Map<String, dynamic> json) {
//     return Fan(
//       status: json['Status'],
//     );
//   }
// }
