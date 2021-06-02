import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:masdamas/screens/home/components/home_header.dart';
import 'package:masdamas/screens/mi%20espacio%20shopping/componentes.dart';


import '../../constants.dart';
import '../../sizec.dart';
import 'devolucion_reembolso.dart';


class Devoluciones extends StatefulWidget {
   Devoluciones ({Key key}) : super(key: key);

  @override
  _DevolucionesState createState() => _DevolucionesState();
}

class _DevolucionesState extends State<Devoluciones> {
 final CollectionReference _productsRef=FirebaseFirestore.instance.collection("products");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kSecondaryColor,
        ),
        flexibleSpace: HomeHeader(),
        leading: Container(),
      ),
      body:
     Column(children: [
           SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left:7,right:7),
              child: Container(
              height: 35,
              width: Sizec.screenWidth,
              decoration: BoxDecoration(
           
               border: Border.all(width: 2, color:kPrimaryColor),
              borderRadius: BorderRadius.circular(6),
              ),    
        child: Row(children: [
        IconButton(
        padding:EdgeInsets.all(4.0),
        alignment: Alignment.topCenter,
        icon:Icon(Icons.arrow_back_ios),color: kSecondaryColor,
        onPressed: (){ Navigator.pop(context);},
        iconSize: 23,
      ),
      SizedBox(width:70),
 Text("DEVOLUCIONES",style:TextStyle(color:kSecondaryColor,fontSize: 17,fontWeight:FontWeight.w600 ))
],),),
),
SizedBox(height: 20),
Text("¿COMO PODEMOS AYUDARTE?",style:TextStyle (color: kPrimaryColor,fontWeight:FontWeight.w700,fontSize: 16 ) ,),
SizedBox(height: 20),
BtnDevoluciones(text: "DEVOLUCION / CAMBIAR",width: 13,press:(){Navigator.push( context, MaterialPageRoute(builder: (context) => DevolucioneR()));}),
SizedBox(height: 30),
Container(
           padding: EdgeInsets.only(left: 1,right:1),
           child: SizedBox(
      width: Sizec.screenWidth/1.3,
      height: 50,
      child: FlatButton(
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
              ),
        onPressed:(){Navigator.push( context, MaterialPageRoute(builder: (context) => DevolucioneR()));
        },
        child:  Row(
          mainAxisAlignment : MainAxisAlignment.center,
                children: <Widget>[
                
                  Text(
                    "DEVOLUCION / REEMBOLSO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
      ),
    ),
         ),
SizedBox(height: 30),
BtnDevoluciones(text: "CANCELAR PEDIDO",width: 13,press:(){}),
SizedBox(height: 30),
BtnDevoluciones(text: "ERROR EN PAGO",width: 13,press: (){}),
SizedBox(height: 30),
BtnDevoluciones(text: "PEDIDO INCOMPLETO",width: 13,press:(){}),





     ],),
      
         
         
      ),
    );
  }
}

 class BtnDevoluciones extends StatelessWidget {
   const BtnDevoluciones({
     Key key,
    this.text,
    this.press,
    this.width,
    this.letra
   }) : super(key: key);

   final String text;
   final Function press;
   final double width,letra;

  @override
   Widget build(BuildContext context) {
     return  Container(
           padding: EdgeInsets.only(left: 1,right:1),
           child: SizedBox(
      width: Sizec.screenWidth/1.3,
      height: 50,
      child: FlatButton(
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
              side: BorderSide(width: 2, color: kSecondaryColor)),
        onPressed: press,
        child:  Row(
          mainAxisAlignment : MainAxisAlignment.center,
                children: <Widget>[
                
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: letra,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
      ),
    ),
 );
   }

 }


