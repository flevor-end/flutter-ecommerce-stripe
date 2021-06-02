import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:local_auth/local_auth.dart';
import 'package:masdamas/blocs/bloc_use.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/home/home.screen.dart';
import 'package:masdamas/screens/sign_in/login.dart';

class CustomDialog extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserBloc userBloc;


  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
      ),      
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
  return Stack(
    children: <Widget>[
     Container(
  padding: EdgeInsets.only(
    top: 30 ,
    bottom: 26,
    left: 26,
    right: 26,
  ),
  margin: EdgeInsets.only(top: 70),
  decoration: new BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10.0,
        offset: const Offset(0.0, 10.0),
      ),
    ],
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min, // To make the card compact
    children: <Widget>[
      Text(
        "¿Desea cerrar la sesión?",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      SizedBox(height: 30.0),
      Row(
         mainAxisAlignment:MainAxisAlignment.spaceAround,
        children:<Widget>[
       FlatButton(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)), 
         textColor: Colors.white,
          color: kSecondaryColor,
          onPressed: () {
           userBloc.signOut();
           Navigator.of(context).pop();

          },
          child: Text("Si"),
        
      ),
      FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        textColor: Colors.white,
          color: kSecondaryColor,
          onPressed: () {
            Navigator.of(context).pop(); 
          },
          child: Text("No"),
        ),
      

        ]
      ),
     
    ],
  ),
),
    ],
  );
}
}

class CustomDialogo extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
      ),      
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
  return Stack(
    children: <Widget>[
     Container(
  padding: EdgeInsets.only(
    top: 30 ,
    bottom: 26,
    left: 26,
    right: 26,
  ),
  margin: EdgeInsets.only(top: 70),
  decoration: new BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10.0,
        offset: const Offset(0.0, 10.0),
      ),
    ],
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min, // To make the card compact
    children: <Widget>[
      Text(
        "¿Desea cerrar la sesión y salir?",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      SizedBox(height: 30.0),
      Row(
         mainAxisAlignment:MainAxisAlignment.spaceAround,
        children:<Widget>[
       FlatButton(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)), 
         textColor: Colors.white,
          color: kSecondaryColor,
          onPressed: () {
           userBloc.signOut();
           Phoenix.rebirth(context);
          },
          child: Text("Si"),
        
      ),
      FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        textColor: Colors.white,
          color: kSecondaryColor,
          onPressed: () {
         Navigator.of(context).pop(); 
          },
          child: Text("No"),
        ),
      

        ]
      ),
     
    ],
  ),
),
    ],
  );
}
}

class Dialogoh extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserBloc userBloc;
  final FlutterSecureStorage storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
      ),      
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
  return Stack(
    children: <Widget>[
     Container(
  padding: EdgeInsets.only(
    top: 30 ,
    bottom: 26,
    left: 26,
    right: 26,
  ),
  margin: EdgeInsets.only(top: 70),
  decoration: new BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10.0,
        offset: const Offset(0.0, 10.0),
      ),
    ],
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min, // To make the card compact
    children: <Widget>[
      Text(
        "Eliminara la huella del dispositivo",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      SizedBox(height: 30.0),
      Row(
         mainAxisAlignment:MainAxisAlignment.spaceAround,
        children:<Widget>[
       FlatButton(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)), 
         textColor: Colors.white,
          color: kSecondaryColor,
          onPressed: () {
          storage.write(key:"perm",value:"false");
             Navigator.pushNamedAndRemoveUntil(context,
             HomeScreen.routeName, (Route<dynamic> route) => false);
             Fluttertoast.showToast(
            msg: "Se ha desvinculado la huella con su Dispositivo",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: kPrimaryColor,
            textColor: Colors.white,
            fontSize: 20);
          },
          child: Text("Si"),
        
      ),
      FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        textColor: Colors.white,
          color: kSecondaryColor,
          onPressed: () {
            Navigator.of(context).pop(); 
          },
          child: Text("No"),
        ),
      

        ]
      ),
     
    ],
  ),
),
    ],
  );
}
}