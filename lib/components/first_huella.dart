
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';
import 'package:masdamas/screens/home/home.screen.dart';

import '../constants.dart';


class Huellap extends StatefulWidget {
    const Huellap({
    Key key,@required this.compatible,
  }) : super(key: key);

  final  bool compatible;
  @override
  _HuellapState createState() => _HuellapState();
}

class _HuellapState extends State<Huellap> {
    final storage = FlutterSecureStorage();

 @override
  void initState() {
    super.initState();
  
   
  }


  final LocalAuthentication auth = LocalAuthentication();
  FirebaseAuth oauth = FirebaseAuth.instance;
  bool canCheck ;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
 




  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
    
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'ingresa tu huella',
          useErrorDialogs: true,
          stickyAuth: true);
            if (authenticated) {
             storage.write(key:"perm", value: 'true');
             Navigator.pushNamedAndRemoveUntil(context,
            HomeScreen.routeName, (Route<dynamic> route) => false);
            Fluttertoast.showToast(
             msg: "Registro Con Huella Exitoso",
             toastLength: Toast.LENGTH_LONG,
             gravity: ToastGravity.CENTER,
             backgroundColor: kSecondaryColor,
             textColor: Colors.white,
             fontSize: 20);
          }

   
    } on PlatformException catch (e) {
          Fluttertoast.showToast(
             msg: "Registro Con Huella Errado",
             toastLength: Toast.LENGTH_LONG,
             gravity: ToastGravity.CENTER,
             backgroundColor: kSecondaryColor,
             textColor: Colors.white,
             fontSize: 20);
    }
    if (!mounted) return;

   
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  @override
  Widget build(BuildContext context) {
   bool  inActive= widget.compatible;
    return Scaffold(
      appBar: AppBar(
        title:  Text('Huella '),
      ),
      body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
              inActive
                  ? Column(
                    children: [
                                           Padding(
      padding: EdgeInsets.symmetric( horizontal: 20),
      child: Hero(
        tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 90.0,
          child: Image.asset('assets/images/logoapp.png'),
        ),
      ),
    ),
    SizedBox(height: 30,),
                   Text("Ingresa tu Huella Digital",style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold ) ,),
                   SizedBox(height: 40,),
                           GestureDetector(
                             onTap:  _authenticate,
                      child: Container( height: 105,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: kSecondaryColor,width: 1.8),
                      ),width:75,child:Image.asset("assets/images/huella.png",) ,),
                           ),
                  
                    ],
                  )
                  : Column(
                    children: [
                         Padding(
      padding: EdgeInsets.symmetric( horizontal: 20),
      child: Hero(
        tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 90.0,
          child: Image.asset('assets/images/logoapp.png'),
        ),
      ),
    ),
                   Text("Tu Dispositivo No Es Acto Para Huella",style:TextStyle(fontSize: 20) ,)
                    ],
                  ),
               
              ])),
    );
  }
}