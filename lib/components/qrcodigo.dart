import 'package:flutter/material.dart';
import 'package:masdamas/sizec.dart';

import '../constants.dart';
import 'custom_bottom_navbar.dart';



class ScannerQr extends StatefulWidget {

  @override
   _ScannerQrState createState() => new  _ScannerQrState();
}

class _ScannerQrState extends State<ScannerQr> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(

        body: Column(children: [
            SizedBox(height: 15,),
            Container(
            height: 33,
            width: Sizec.screenWidth,
            decoration: BoxDecoration(
              color: kSecondaryColor
            ),
              
        child: Row(children: [
        IconButton(
        padding:EdgeInsets.all(4.0),
        alignment: Alignment.topCenter,
        icon:Icon(Icons.arrow_back_ios),color: Colors.white,
        onPressed: (){ Navigator.pop(context);},
        iconSize: 25,
      ),
  Align(child: Text("CODIGO QR",style:TextStyle(color:Colors.white,fontSize: 18,fontWeight:FontWeight.bold )),widthFactor: Sizec.screenWidth/135,),
],),),
SizedBox(height: 25,),
Text("COMPARTE-ACCEDE-RECIBE",style:TextStyle(color: kSecondaryColor,fontSize: 16,fontWeight:FontWeight.bold )),
SizedBox(height: 25,),
Container( 
  
  width: 250,
  height: 250,
  decoration: BoxDecoration(
    border: Border.all(color: kSecondaryColor,width: 2),
    borderRadius:BorderRadius.circular(10),
    color: Colors.white,
    image: DecorationImage(
    image: AssetImage('assets/images/codigoqr.jpg'),
    fit:BoxFit.fill,  
   ),
  ),
  ),
SizedBox(height: 30,),
Container( 
  width: 280,
  height: 100,
  decoration: BoxDecoration(
    border: Border.all(color: kSecondaryColor,width: 2),
    borderRadius:BorderRadius.circular(10),
    color: Colors.white,
       image: DecorationImage(
    image: AssetImage('assets/images/codigobarras.jpg'),
    fit:BoxFit.fill,  
   ),
  ),),
  SizedBox(height: 30,),
  MaterialButton(   shape: RoundedRectangleBorder(
        
        ),
        padding: EdgeInsets.only(left:50,right: 50,top: 15,bottom: 15),
        color: kSecondaryColor,
        onPressed: () {  },
        child: Text('COMPARTIR',
        style: TextStyle(color: Colors.white, fontSize: 15)),)
        ],),
      bottomNavigationBar:   CustomBottomNavBar(color: false,color2: false,color3: false,),
      ),
    );
    
  }
}