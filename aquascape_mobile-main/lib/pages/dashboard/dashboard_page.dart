import 'package:aquascape_mobile/pages/dashboard/dashboard_widgets/dashboard_fan.dart';
import 'package:aquascape_mobile/pages/dashboard/dashboard_widgets/dashboard_light.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import 'dashboard_widgets/dashboard_feeder.dart';
import 'dashboard_widgets/dashboard_ph.dart';
import 'dashboard_widgets/dashboard_temperature.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dasboard'),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            //Lampu
            margin: const EdgeInsets.all(20),
            elevation: 4,
            shadowColor: Colors.black,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardLight(),
                    ));
              },
              splashColor: Colors.black,
              child: Center(
                child: Column(
                  children: const <Widget>[
                    Icon(
                      Icons.lightbulb_outline,
                      size: 100,
                      color: Colors.black,
                    ),
                    Text(
                      "Lampu",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            //Sensor PH
            margin: const EdgeInsets.all(20),
            elevation: 4,
            shadowColor: Colors.black,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardSensorPH(),
                    ));
              },
              splashColor: Colors.black,
              child: Center(
                  child: Column(
                children: const <Widget>[
                  Icon(
                    Icons.sensors,
                    size: 100,
                    color: Colors.black,
                  ),
                  Text("Sensor PH", style: TextStyle(fontSize: 17.0)),
                ],
              )),
            ),
          ),
          Card(
            //Temperature
            margin: const EdgeInsets.all(20),
            elevation: 4,
            shadowColor: Colors.black,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardTemperature(),
                    ));
              },
              splashColor: Colors.black,
              child: Center(
                  child: Column(
                children: const <Widget>[
                  Icon(
                    Icons.thermostat,
                    size: 100,
                    color: Colors.black,
                  ),
                  Text("Temperature", style: TextStyle(fontSize: 17.0)),
                ],
              )),
            ),
          ),
          Card(
            //Fish Feeder
            margin: const EdgeInsets.all(20),
            elevation: 4,
            shadowColor: Colors.black,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardFishFeeder(),
                    ));
              },
              splashColor: Colors.black,
              child: Center(
                  child: Column(
                children: const <Widget>[
                  Icon(
                    Icons.restaurant,
                    size: 100,
                    color: Colors.black,
                  ),
                  Text("Fish Feeder", style: TextStyle(fontSize: 17.0)),
                ],
              )),
            ),
          ),
          Card(
            //Fan
            margin: const EdgeInsets.all(20),
            elevation: 4,
            shadowColor: Colors.black,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardFan(),
                    ));
              },
              splashColor: Colors.black,
              child: Center(
                  child: Column(
                children: const <Widget>[
                  Icon(
                    Icons.mode_fan_off_outlined,
                    size: 100,
                    color: Colors.black,
                  ),
                  Text("Fan", style: TextStyle(fontSize: 17.0)),
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
