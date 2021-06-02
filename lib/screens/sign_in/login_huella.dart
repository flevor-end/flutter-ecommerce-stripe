

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/home/home.screen.dart';
import 'package:masdamas/screens/profile/components/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginHuella extends StatefulWidget {
  LoginHuella({Key key}) : super(key: key);

  @override
  LoginHuellaState createState() =>LoginHuellaState();
}

class LoginHuellaState extends State<LoginHuella> {
 String error;
 final LocalAuthentication oauth = LocalAuthentication();
 FirebaseAuth auth=FirebaseAuth.instance;
 final FlutterSecureStorage storage = FlutterSecureStorage();
 bool _isBiometricAvailable=false;
 SharedPreferences prefs;
   @override
  void initState() {
    super.initState();
    getSecureStorage();
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
    
      authenticated = await oauth.authenticateWithBiometrics(
          localizedReason: 'ingresa tu huella',
          useErrorDialogs: true,
          stickyAuth: true);
            if (authenticated) {
            
            try {
            final storedEmail = await storage.read(key: "email");
            final storedPassword = await storage.read(key:'pass');
                User user = (await auth.signInWithEmailAndPassword(
                email: storedEmail , password: storedPassword)).user;  

                
               
                if (user != null) {
                 Navigator.pushNamedAndRemoveUntil(context,
                 HomeScreen.routeName, (Route<dynamic> route) => false);
                  Fluttertoast.showToast(
                        msg: "Haz ingresado con huella Exitosamente",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: kPrimaryColor,
                        textColor: Colors.white,
                        fontSize: 30);
                  await prefs.setString('id', auth.currentUser.uid);
                  await prefs.setString('nickname', auth.currentUser.displayName);
                  await prefs.setString('photoUrl', auth.currentUser.photoURL);

                }
              } catch (e) {
                switch (e.code) {
                  case "user-not-found":
                    error = 'Usuario Inexistente';
                    Fluttertoast.showToast(
                        msg: error,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: kSecondaryColor,
                        textColor: Colors.white,
                        fontSize: 2);
                    break;
                  case "wrong-password":
                    error = 'Clave Erronea';
                    Fluttertoast.showToast(
                        msg: error,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor:kSecondaryColor,
                        textColor: Colors.white,
                        fontSize:20);
                    break;
                    case "object-not-found":
                    error = 'Complete su Registro';
                    Fluttertoast.showToast(
                        msg: error,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: kSecondaryColor,
                        textColor: Colors.white,
                        fontSize: 20);
                        break;
                  default:
                    print(e);
  
                    break;
                }
               
              }
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text("Iniciar Sesion Con Huella"),
        ),
     body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              _isBiometricAvailable
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
                    SizedBox(height: 20,),
                    FlatButton(
        child: Text(
          'Desvincular Huella del dispositivo',
          style: TextStyle(
              color: Color(0xff0E2D4F),
              decoration: TextDecoration.underline,
              fontSize: 15),
        ),
        onPressed: () async {
        showDialog(
                  context: context,
                  builder: (buildcontext) {
                    return Dialogoh();
                  });

        }
                    ),    
                  
                    ],
                  )
                  : Column(
                    children: [
                         Padding(
      padding: EdgeInsets.symmetric( horizontal: 10),
      child: Hero(
        tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 90.0,
          child: Image.asset('assets/images/logoapp.png'),
        ),
      ),
    ),
                   Padding(
                     padding: const EdgeInsets.only(left:10,right:10),
                     child: Text("Inicia Sesion para Configurar huella digital",style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold) ,textAlign:TextAlign.center),
                   )
                    ],
                  ),
               
              ])) ,
    );
  }  
  
  void getSecureStorage() async {
    final isUsingBio = await storage.read(key:"perm");
    setState(() {
      _isBiometricAvailable = isUsingBio == 'true';
    });
  }
}