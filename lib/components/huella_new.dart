import 'package:encrypt/encrypt.dart' as en;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:masdamas/components/first_huella.dart';
import 'package:masdamas/constants.dart';

import '../sizec.dart';


class HuellaNew extends StatefulWidget {

 static String routeName = 'huella';

 @override 
 HuellaNewState createState() => HuellaNewState();

}

  class HuellaNewState extends State <HuellaNew> {

  final LocalAuthentication oauth = LocalAuthentication();
  FirebaseAuth auth=FirebaseAuth.instance;
  final _auth = FirebaseAuth.instance;
  final key = en.Key.fromLength(32);
  final storage = FlutterSecureStorage();
   String name="";
  
  final iv = en.IV.fromLength(16);
  bool _canCheckBiometrics;

 @override
  void initState() {
    super.initState();
    _checkBiometrics();
      if(_auth.currentUser.displayName != null){

     name=_auth.currentUser.displayName;



   }

   }
  
 


  @override
  Widget build(BuildContext context) {
  
  
  return SafeArea(
  child: Scaffold(
  
  body: Container(
  child: Column(
  children :[   
      SizedBox(height:20),   
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

          SizedBox(height: Sizec.screenHeight>700 ?30:20,),
          Text("Configurar Huella Para "+name+"Con Dispositivo Actual",style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold ),textAlign:TextAlign.center,),
          SizedBox(height: Sizec.screenHeight>700?50:40,),
          Padding(
          padding: EdgeInsets.only(left:50,right:1),
          child: CheckboxListTile(
          activeColor: kPrimaryColor,
          title: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 1.0),
          child: Text(
          'Acepto Terminos y Condiciones Para Registar Huella',
          textAlign:TextAlign.start,
          style: TextStyle(
          color: kSecondaryColor,
          decoration: TextDecoration.underline,
          fontSize: 16),
          ),
          onPressed: () {},
        ),// The named parameter 'title' isn't defined.
            value: true,
            onChanged: (newValue) {},
            controlAffinity:
            ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
        ),
            
          SizedBox(height: Sizec.screenHeight>700 ?50:40,),
          Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0, horizontal:10),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () async {
             _checkBiometrics();
             Navigator.push(context,MaterialPageRoute(builder: (context) => Huellap(compatible:_canCheckBiometrics)),
        );
            },
            padding: EdgeInsets.all(12),
            color: Color(0xff0E2D4F),
            child: Text('Continuar', style: TextStyle(color: Colors.white,fontSize: 20)),
          ),
        ),
        
          ]

           )
        ),
    ), 
  );
  }
    Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await oauth.canCheckBiometrics;
         
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      
      _canCheckBiometrics = canCheckBiometrics;
    });
  }
}