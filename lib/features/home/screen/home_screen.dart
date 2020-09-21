import 'package:flutter/material.dart';
import 'package:ned_template/features/auth/screen/sign_in.dart';

class HomeScreen extends StatefulWidget {
  static const String route = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              alignment: Alignment.center,
              child: Container(),
            ),
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        'Share, Make Friends',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff384f7d),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Create your account to get started. After that, you can share books and make friends.',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xbb384f7d),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      FlatButton(
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff384f7d),
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              SignInScreen.route,
                              (Route<dynamic> route) => false);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
