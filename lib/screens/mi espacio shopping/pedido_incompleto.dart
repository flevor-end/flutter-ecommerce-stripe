import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:masdamas/screens/home/components/home_header.dart';
import 'package:masdamas/screens/mi%20espacio%20shopping/banner_shopping.dart';
import 'package:masdamas/screens/mi%20espacio%20shopping/componentes.dart';


import '../../constants.dart';
import '../../sizec.dart';


class PedidoI extends StatefulWidget {
  PedidoI({Key key}) : super(key: key);

  @override
  _PedidoIState createState() => _PedidoIState();
}

class _PedidoIState extends State<PedidoI> {
 final CollectionReference _productsRef =
  FirebaseFirestore.instance.collection("products");

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
 SizedBox(width:16),
 Text("PEDIDO INCOMPLETO",style:TextStyle(color:kSecondaryColor,fontSize: 17,fontWeight:FontWeight.w600 ))
],),),
),
SizedBox(height: 20),
Text("¿MOTIVO DEVOLUCION / REEMBOLSO?",style:TextStyle (color: kPrimaryColor,fontWeight:FontWeight.w700,fontSize: 16 ),),
SizedBox(height: 10),
Row(
  
   mainAxisAlignment :MainAxisAlignment.center,
  children: [
Column(children: [

Row(
  children: [
        
        Radio(value: null, groupValue: null, onChanged: null,activeColor: kPrimaryColor,),
        Text("Opcion",style:TextStyle (color: kSecondaryColor,fontWeight:FontWeight.w700,fontSize: 12 ),),
  ],
),
Row(
  children: [
        
        Radio(value: null, groupValue: null, onChanged: null,activeColor: kPrimaryColor,),
        Text("Opcion",style:TextStyle (color: kSecondaryColor,fontWeight:FontWeight.w700,fontSize: 12 ),),
  ],
),
Row(
  children: [
        
        Radio(value: null, groupValue: null, onChanged: null,activeColor: kPrimaryColor,),
        Text("Opcion",style:TextStyle (color: kSecondaryColor,fontWeight:FontWeight.w700,fontSize: 12 ),),
  ],
),
Row(
  children: [
        
        Radio(value: null, groupValue: null, onChanged: null,activeColor: kPrimaryColor,),
        Text("Opcion",style:TextStyle (color: kSecondaryColor,fontWeight:FontWeight.w700,fontSize: 12 ),),
  ],
)

],),

SizedBox(width: 100,),
Column(children: [
Row(
  children: [
        
        Radio(value: null, groupValue: null, onChanged: null,activeColor: kPrimaryColor,),
        Text("Opcion",style:TextStyle (color: kSecondaryColor,fontWeight:FontWeight.w700,fontSize: 12 ),),
  ],
),
Row(
  children: [
        
        Radio(value: null, groupValue: null, onChanged: null,activeColor: kPrimaryColor,),
        Text("Opcion",style:TextStyle (color: kSecondaryColor,fontWeight:FontWeight.w700,fontSize: 12 ),),
  ],
),
Row(
  children: [
        
        Radio(value: null, groupValue: null, onChanged: null,activeColor: kPrimaryColor,),
        Text("Opcion",style:TextStyle (color: kSecondaryColor,fontWeight:FontWeight.w700,fontSize: 12 ),),
  ],
),
Row(
  children: [
        
        Radio(value: null, groupValue: null, onChanged: null,activeColor: kPrimaryColor,),
        Text("Opcion",style:TextStyle (color: kSecondaryColor,fontWeight:FontWeight.w700,fontSize: 12 ),),
  ],
)
  
],)
],),
SizedBox(height: 8,),

   Row(
      mainAxisAlignment :MainAxisAlignment.center,
     children: [
       Container(
               padding: EdgeInsets.only(left: 4,right:1),
               child: SizedBox(
          width: Sizec.screenWidth/2.2,
          height: 35,
          child: FlatButton(
            color: kPrimaryColor,
            
            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
             
            ),
            onPressed: (){},
            child:  Row(
              mainAxisAlignment : MainAxisAlignment.center,
                    children: <Widget>[
                    
                      Text(
                        "ADJUNTAR IMAGENES",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize:12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
          ),
        ),
             ),
             SizedBox(width:10,),
                Container(
           padding: EdgeInsets.only(left: 4,right:1),
           child: SizedBox(
      width: Sizec.screenWidth/2.2,
      height: 35,
      child: FlatButton(
        
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
             side: BorderSide(
            color: kSecondaryColor,
            width: 1.5,
            style: BorderStyle.solid
          )
        ),
        onPressed: (){},
        child:  Row(
          mainAxisAlignment : MainAxisAlignment.center,
                children: <Widget>[
                
                
                ],
              ),
      ),
    ),
         ),
     ],
   ),
   SizedBox(height: 20,),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
            borderSide: BorderSide(
            color: kSecondaryColor,
            width: 1.5,
            style: BorderStyle.solid
          )
      )
      
    )
  ),
),
SizedBox(height: 20,),
BtnContinuar(text: "CONTINUAR",width: 13,press: (){}),




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


