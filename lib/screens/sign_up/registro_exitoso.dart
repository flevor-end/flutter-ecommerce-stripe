
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masdamas/blocs/bloc_use.dart';
import 'package:masdamas/screens/components/avatar.dart';
import 'package:masdamas/screens/sign_up/registro_perfil.dart';

import '../../sizec.dart';

class RegistroExitoso extends StatefulWidget {
 static String routeName = 'registroexitoso';


 RegistroExitoso ({Key key}) : super(key: key);

  @override
   PerfilregistroState createState() =>  PerfilregistroState();
}

class  PerfilregistroState extends State <RegistroExitoso > {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        
      leading: Container(),

        ),
     body:Column(

       children:[
        
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
        Text("REGISTRO EXITOSO",style: TextStyle(fontSize: 35,fontWeight:FontWeight.bold ),textAlign:TextAlign.center,),
         SizedBox(height: Sizec.screenHeight>700 ?30:20,),
        Text("BIENVENIDO",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold ),textAlign:TextAlign.center,),
        SizedBox(height: Sizec.screenHeight>700 ?30:20,),
          Avatar(
          ),
          SizedBox(height: Sizec.screenHeight>700 ?30:20,),
           Text(auth.currentUser?.displayName,style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold ),textAlign:TextAlign.center,),
           SizedBox(height: Sizec.screenHeight>700 ?30:20,),
            Text("Desde la seccion mi espacio podras \n gestionar tu perfil y mucho mas ",style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold ),textAlign:TextAlign.center,),
            SizedBox(height: Sizec.screenHeight>700 ?30:20,),
           Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0, horizontal:80),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () async {
             Navigator.of(context).pushReplacementNamed(Perfilregistro.routeName);
        },
        padding: EdgeInsets.all(12),
        color: Color(0xff0E2D4F),
        child: Text('Continuar', style: TextStyle(color: Colors.white)),
      ),
    ),


       ]

     )
    );
  }
}