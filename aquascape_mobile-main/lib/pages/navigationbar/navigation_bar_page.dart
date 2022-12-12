import 'package:aquascape_mobile/pages/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../utils/CustomAnimatedBottomBar.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';
import 'navigation_bar_controller.dart';

class NavigationBarBot extends StatefulWidget {
  const NavigationBarBot({super.key});

  @override
  State<NavigationBarBot> createState() => _NavigationBarBotState();
}

class _NavigationBarBotState extends State<NavigationBarBot> {
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationBarController>(builder: (controller) {
      return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [HomePage(), DashboardPage(), ProfilePage()],
            ),
          ),
          bottomNavigationBar: CustomAnimatedBottomBar(
            containerHeight: 70,
            backgroundColor: Colors.white,
            selectedIndex: controller.tabIndex,
            showElevation: true,
            itemCornerRadius: 24,
            curve: Curves.easeIn,
            onItemSelected: controller.changeTabIndex,
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: Icon(Icons.home_outlined),
                title: Text('Home'),
                activeColor: Colors.black,
                inactiveColor: _inactiveColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.message),
                title: Text(
                  'Dashboard ',
                ),
                activeColor: Colors.black,
                inactiveColor: _inactiveColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.people),
                title: Text('Users'),
                activeColor: Colors.black,
                inactiveColor: _inactiveColor,
                textAlign: TextAlign.center,
              ),

              /*BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
                activeColor: Colors.blue,
                inactiveColor: _inactiveColor,
                textAlign: TextAlign.center,
              ),*/
            ],
          ));
    });
  }
}
