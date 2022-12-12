import 'package:aquascape_mobile/controllers/auth_controller.dart';
import 'package:aquascape_mobile/pages/home/home_page.dart';
import 'package:aquascape_mobile/pages/login/login_page.dart';
import 'package:aquascape_mobile/pages/navigationbar/navigation_bar_page.dart';
import 'package:aquascape_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils().init(context);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: GetBuilder<AuthController>(
        builder: (_) {
          return SafeArea(
            child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Utils.screenWidth! * 0.04),
                child: _.isSignedIn.value ? NavigationBarBot() : LoginPage()),
          );
        },
      ),
    );
  }
}
