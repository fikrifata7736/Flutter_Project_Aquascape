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
                child: Image.asset('assets/images/ceiling-lamp.gif'),
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
                child: Image.asset('assets/images/thermometer.gif'),
              ),
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
                child: Image.asset('assets/images/temperature.gif'),
              ),
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
                child: Image.asset('assets/images/burger.gif'),
              ),
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
                child: Image.asset('assets/images/fan.gif'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
