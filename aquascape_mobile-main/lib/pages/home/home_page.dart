import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:async';
import '../../utils/CustomAnimatedBottomBar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = 'https://aquascapebackend-tdfkwdj56a-et.a.run.app/lamp';
  List futureLamp = [];
  // List<String> course = [];
  // late Future<_Data> futureData;

  @override
  void initState() {
    super.initState();
    this.futureLamp;
  }

  Future<String> getJsonData() async {
    var response = await http.get(
        Uri.parse('https://aquascapebackend-tdfkwdj56a-et.a.run.app/lamp'));
    final data = json.decode(response.body);

    print(response.body);
    setState(() {
      futureLamp = data;
      print(data);
    });

    return "Succes";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: new ListView.builder(
        itemCount: futureLamp.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      child: new Text(futureLamp[index]["status"]),
                      padding: const EdgeInsets.all(20.0),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(
  //         "Home page",
  //         style: TextStyle(color: Colors.white),
  //       ),
  //       elevation: 0,
  //       backgroundColor: Colors.black,
  //     ),
  //     body: Container(
  //       child: Center(
  //         child: Text(
  //           "Home Page",
  //           style: TextStyle(fontSize: 20),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
