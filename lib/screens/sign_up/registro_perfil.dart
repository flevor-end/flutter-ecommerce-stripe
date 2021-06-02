



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masdamas/blocs/bloc_use.dart';
import 'package:masdamas/components/huella_new.dart';
import 'package:masdamas/screens/components/avatar.dart';
import 'package:masdamas/screens/home/home.screen.dart';
import 'package:masdamas/constants.dart';

class Perfilregistro extends StatefulWidget {
 static String routeName = 'registroperfil';


 Perfilregistro({Key key}) : super(key: key);

  @override
   PerfilregistroState createState() =>  PerfilregistroState();
}

class  PerfilregistroState extends State <Perfilregistro> {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:AppBar(   
      title: Center(child: Text("FOTO DE PERFIL"),widthFactor: 2,),   
      leading: Container(),
        ),
       body:SafeArea(
       child:
       Column(
       children:[   
        SizedBox(height: 50),
        Text("SUBE UNA FOTO DE PERFIL",style: TextStyle(fontSize: 22,fontWeight:FontWeight.bold ),textAlign:TextAlign.center,),
        SizedBox(height: 40,),
        Avatar(
        ),
        SizedBox(height: 40,),
        Row(
        mainAxisSize: MainAxisSize.min,
        children: [
        FlatButton(
        child: Text(
        'Añadir Foto',
        style: TextStyle(
        color: Color(0xff0E2D4F),
        decoration: TextDecoration.underline,
        fontSize: 15),
      ),
      onPressed: () async {
      
      },
    ),
    Icon(Icons.account_box_outlined),
            ],
          ),
           SizedBox(height: 30,),
           Text(auth.currentUser?.displayName,style: TextStyle(fontSize: 24,fontWeight:FontWeight.bold ),textAlign:TextAlign.center,),
           SizedBox(height: 60,),
               Padding(
      padding: EdgeInsets.symmetric( horizontal:1),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () async {
            
        Navigator.pushNamed(context,HuellaNew.routeName);
        
        },
        padding: EdgeInsets.all(10),
        color: kSecondaryColor,
        child: Text('¿Desea Ingresar\n Con Su Huella?', style: TextStyle(color: Colors.white,fontSize: 14)),
      ),
    ),
      SizedBox(height: 20,),
      Padding(
      padding: EdgeInsets.symmetric( horizontal:80),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
         Navigator.pushNamedAndRemoveUntil(context,
         HomeScreen.routeName, (Route<dynamic> route) => false);
        },
        padding: EdgeInsets.all(14),
        color: kSecondaryColor,
        child: Text('Continuar', style: TextStyle(color: Colors.white,fontSize: 18)),
      ),
    ),
    

 ]
)
     ),
    );
  }
}