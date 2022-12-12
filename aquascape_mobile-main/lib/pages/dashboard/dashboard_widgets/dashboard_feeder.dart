import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class DashboardFishFeeder extends StatefulWidget {
  const DashboardFishFeeder({super.key});

  @override
  State<DashboardFishFeeder> createState() => _DashboardFishFeeder();
}

class _DashboardFishFeeder extends State<DashboardFishFeeder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: ('Fish Feeder'),
      ),
    );
  }
}
