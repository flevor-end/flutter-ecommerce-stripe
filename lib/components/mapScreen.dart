

import 'package:flutter/material.dart';





class Mapscreen extends StatefulWidget {
    static String routeName = 'mapa';
  @override
  _MapscreenState createState() => _MapscreenState();
}

//carrusel de spash explicativos
class _MapscreenState extends State<Mapscreen> {
  
String direccion= "Carrera 5 # 6-56";

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
           leading: IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: (){

            _sBack(context);

           },),
        title: Text(" ¿ Estas aqui ?"),
      ),
        body:Container(
          decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage('assets/images/map.gif'),
             fit:BoxFit.fill,  
           ),
          ),
           child: Column(

             children: [
             
      Container(color:Colors.white ,child: Align(child: Text("Carrera 5 # 6-56",style:TextStyle(color: Colors.blue[900],fontWeight:FontWeight.bold ,fontSize: 18)),alignment:Alignment.bottomCenter ,heightFactor: 0.8,)),
      Align(child:RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: () {
        _sendDataBack(context);
     
          },
          padding: EdgeInsets.all(15),
          color: Color(0xff0E2D4F),
          child: Text('Escoger Direccion', style: TextStyle(color: Colors.white,fontSize: 19)),
        ),
        heightFactor: 10,
        alignment : Alignment.bottomCenter
    ),
      
    
                
        
             ],
           ),
        ),
      ),
    );
  }

    void _sendDataBack(BuildContext context) {
    String textToSendBack = direccion;
    Navigator.pop(context, textToSendBack);
  }
    void _sBack(BuildContext context) {
    String textToSendBack = "     Tu Ubicacion   ";
    Navigator.pop(context, textToSendBack);
  }

}