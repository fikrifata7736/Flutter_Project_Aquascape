import 'package:aquascape_mobile/pages/login/login_widgets/login_form.dart';
import 'package:aquascape_mobile/utils/utils.dart';
import 'package:aquascape_mobile/widgets/hero_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          margin: EdgeInsets.only(),
          child: Image.asset(
            'assets/images/LOGO-pervasive.png',
            height: 260,
            width: 260,
          ),
        ),
        // shows header title
        // HeroTitle(
        //   title: 'Welcome!',
        //   subtitle: 'Enter email and password to login...',
        // ),
        // shows textfields and buttons
        SignInForm(),
      ],
    );
  }
}
