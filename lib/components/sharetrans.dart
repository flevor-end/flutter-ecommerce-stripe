import 'package:flutter/material.dart';
import 'dart:async';



class Trasha extends StatefulWidget {
  static String routeName = 'splash';
  @override
  _TrashaState createState() => new  _TrashaState();
}

class _TrashaState extends State<Trasha> {
  startTime() async {
    var _duration = new Duration(milliseconds: 19000);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
  Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Container(
          decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage('assets/images/chatw.gif'),
             fit:BoxFit.fill,  
             
           ),
          ),
        )
      )
    );
}
}