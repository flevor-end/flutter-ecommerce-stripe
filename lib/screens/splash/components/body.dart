import 'dart:async';

import 'package:flutter/material.dart';
import 'package:masdamas/screens/home/home.screen.dart';




class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

//carrusel de spash explicativos
class _BodyState extends State<Body> {
    startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage); 
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
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
             image: AssetImage('assets/images/animacion.jpg'),
             fit:BoxFit.fill,  
           ),
          ),
           
            
          ),
        ),
      
    );
  }

}
