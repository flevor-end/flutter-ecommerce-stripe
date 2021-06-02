import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/profile/profile_screen.dart';
import 'dart:async';

import 'package:masdamas/screens/splash/splash_screen.dart';


class Transicion extends StatefulWidget {
  static String routeName = 'transic';
  @override
  _TransicionState createState() => new _TransicionState();
}

class _TransicionState extends State<Transicion> {
  startTime() async {
    var _duration = new Duration(seconds:1);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: SizedBox(
                height: 20,
                width: 70,
                child: CircularProgressIndicator(
                backgroundColor: kPrimaryColor,
                )),
              ),
            ],
          ),  
        ],
      ),
    );
  }
}
