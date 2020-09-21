import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ned_template/features/auth/screen/sign_in.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 120,
          height: 120,
        ),
      ),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    Navigator.of(context).pushNamed(SignInScreen.route);
    // SharedPreferences preferences = await SharedPreferences.getInstance();

    // if (preferences.getBool(Preferences.is_logged_in) ?? false) {
    //   Navigator.of(context).pushNamed(Routes.home);
    // } else {
    //   Navigator.of(context).pushNamed(Routes.login);
    // }
  }
}
