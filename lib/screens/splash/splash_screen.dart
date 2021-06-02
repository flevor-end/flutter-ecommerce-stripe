import 'package:flutter/material.dart';
import 'package:masdamas/screens/splash/components/body.dart';
import 'package:masdamas/sizec.dart';

class SplashScreen2 extends StatelessWidget {
  static String routeName = 'splash2';
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    Sizec().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
