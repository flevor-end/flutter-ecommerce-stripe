import 'package:flutter/material.dart';
import 'package:masdamas/screens/home/components/home_header.dart';
import 'package:masdamas/screens/mi%20espacio%20shopping/banner_shopping.dart';
import 'package:masdamas/sizec.dart';

import '../../constants.dart';

class DetallesP extends StatefulWidget {
 DetallesP({Key key}) : super(key: key);

  @override
  _DetallesPState createState() => _DetallesPState();
}

class _DetallesPState extends State<DetallesP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
        iconTheme: IconThemeData(
          color: kSecondaryColor,
        ),
        flexibleSpace: HomeHeader(),
        leading: Container(),
      ),
      
      body:Column(children: [
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
  Align(child: Text("DETALLES FINALES DEL PEDIDO",style:TextStyle(color:kSecondaryColor,fontSize: 17,fontWeight:FontWeight.w600 )),widthFactor:  Sizec.screenWidth/380),
],),),
),
        SizedBox(height: 15,),
        Text("Nro.Pedido",style:TextStyle(color:kPrimaryColor,fontSize: 14,fontWeight:FontWeight.w600 )),
        SizedBox(height: 15,),
        Column(children: [
         
         Padding(
           padding: const EdgeInsets.only(left:9,right:9),
           child: Container(
             decoration:BoxDecoration(
               color: kSecondaryColor,
                 borderRadius: BorderRadius.only(topLeft:Radius.circular(5.0) ,topRight: Radius.circular(5.0)
    ),
  ), 
             height: 45,
             width: Sizec.screenWidth,
             child: Column(
               mainAxisAlignment : MainAxisAlignment.center,
               children: [
           
           Text("Pedido Entregado El dia de mes del 2021 ",style:TextStyle(color:Colors.white,fontSize: 14,fontWeight:FontWeight.w500 )),
           Text("Precio:",style:TextStyle(color:Colors.white,fontSize: 14,fontWeight:FontWeight.w500 )),

           ],),),
         ),
                 
         Padding(
           padding: const EdgeInsets.only(left:9,right:9),
           child: Container(
             decoration:BoxDecoration(

              border: Border.all(width: 2, color: kSecondaryColor),
           
            
  ), 
             height: 150,
             width: Sizec.screenWidth,
             child: Column(
               mainAxisAlignment : MainAxisAlignment.center,
               children: [
           
           Row(
           mainAxisAlignment : MainAxisAlignment.spaceBetween,
             children: [
               Column(
                 crossAxisAlignment : CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8,),
                     child: Text("Productos Comprados:",style:TextStyle(color:Colors.grey,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left:8,),
                     child: Text("Producto",style:TextStyle(color:Colors.black,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                  SizedBox(height: 10,),
                   Padding(
                   padding: const EdgeInsets.only(left:8,),
                     child: Text("Direccion de entrega:",style:TextStyle(color:Colors.grey,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                   Padding(
                    padding: const EdgeInsets.only(left:8,),
                     child: Text("Direccion",style:TextStyle(color:Colors.black,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                  SizedBox(height: 10,),
                 
        
                   Padding(
                      padding: const EdgeInsets.only(left:8,),
                     child: Text("Tipo de envio:",style:TextStyle(color:Colors.grey,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                   
                   Padding(
                      padding: const EdgeInsets.only(left:8,),
                     child: Text("Gratis",style:TextStyle(color:Colors.black,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                 ],
               ),
                Column(
                  crossAxisAlignment : CrossAxisAlignment.end,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(right:8,),
                     child: Text("Estado",style:TextStyle(color:Colors.grey,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(right:8,),
                     child: Text("Nuevo",style:TextStyle(color:Colors.grey,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                  SizedBox(height: 10,),
                   Padding(
                   padding: const EdgeInsets.only(right:8,),
                     child: Text("Cantidad",style:TextStyle(color:Colors.grey,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                   Padding(
                    padding: const EdgeInsets.only(right:8,),
                     child: Text("1 Unidad",style:TextStyle(color:Colors.grey,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                  SizedBox(height: 10,),
                 
        
                   Padding(
                      padding: const EdgeInsets.only(right:8,),
                     child: Text("Duracion",style:TextStyle(color:Colors.grey,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                   
                   Padding(
                      padding: const EdgeInsets.only(right:8,),
                     child: Text("5 Dias",style:TextStyle(color:Colors.grey,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                 ],
               ),
             ],
           ),
         

           ],),),
         ),

          
        ],),
        
            Row(
              children: [
                Padding(
           padding: const EdgeInsets.only(left:9),
           child: Container(
                 decoration:BoxDecoration(
         border: Border(left:BorderSide( //              
        color: kSecondaryColor,
        width: 2.0,
      ),right: BorderSide(                   
        color: kSecondaryColor,
        width: 2.0,
      ),bottom: BorderSide(             
        color: kSecondaryColor,
        width: 2.0,
      ), )
           
                
  ), 
   height: 210,
  width: Sizec.screenWidth/1.7,
  child: Column(
                 crossAxisAlignment : CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 8,),
                   Padding(
                     padding: const EdgeInsets.only(left:8,),
                     child: Text("Metodos de pago:",style:TextStyle(color:Colors.grey,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left:8,),
                     child: Text("Tarjeta Master",style:TextStyle(color:Colors.black,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                  SizedBox(height: 8,),
                   Padding(
                   padding: const EdgeInsets.only(left:8,),
                     child: Text("Direccion de facturacion:",style:TextStyle(color:Colors.grey,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                   Padding(
                    padding: const EdgeInsets.only(left:8,),
                     child: Text("Nombre Persona",style:TextStyle(color:Colors.black,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                     Padding(
                    padding: const EdgeInsets.only(left:8,),
                     child: Text("Direccion",style:TextStyle(color:Colors.black,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                     Padding(
                    padding: const EdgeInsets.only(left:8,),
                     child: Text("Pedido",style:TextStyle(color:Colors.black,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                   SizedBox(height: 8,),
                  BtnDetalles(text:"VER RECIBO",color: kSecondaryColor,press: (){},),
                  SizedBox(height: 8,),
                  BtnDetalles(text:"GUARDAR RECIBO",color: kPrimaryColor,press: (){},)
                   
                  
               

               
                 
        
               
                 ],
               ), 
                 
           ),
                ),
                         Padding(
           padding: const EdgeInsets.only(right:9),
           child: Container(
                 decoration:BoxDecoration(
         border: Border(right: BorderSide(                   
        color: kSecondaryColor,
        width: 2.0,
      ),bottom: BorderSide(             
        color: kSecondaryColor,
        width: 2.0,
      ), )
           
                
  ), 
                 height: 210,
                 width: Sizec.screenWidth/2.75,
                  child: Column(
                 crossAxisAlignment : CrossAxisAlignment.end,
                 children: [
                   SizedBox(height: 8,),
                   Padding(
                     padding: const EdgeInsets.only(right:8,),
                     child: Text("Informacion:",style:TextStyle(color:Colors.grey,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(right:8,),
                     child: Text("Productos",style:TextStyle(color:Colors.black,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                    Padding(
                     padding: const EdgeInsets.only(right:8,),
                     child: Text("Precio",style:TextStyle(color:Colors.black,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                 SizedBox(height: 8,),
                   Padding(
                   padding: const EdgeInsets.only(right:8,),
                     child: Text("Envio Gratis",style:TextStyle(color:Colors.grey,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                   SizedBox(height: 5,),
                   Padding(
                    padding: const EdgeInsets.only(right:8,),
                     child: Text("Impuestos",style:TextStyle(color:Colors.black,fontSize: 14,fontWeight:FontWeight.w500 )),
                   ),
                     Padding(
                    padding: const EdgeInsets.only(right:8,),
                     child: Text("Precio",style:TextStyle(color:Colors.black,fontSize: 14,fontWeight:FontWeight.w500 )),
                     
                   ),
                    SizedBox(height: 20,),
                  
          Container(
                 decoration:BoxDecoration(
         border: Border(top: BorderSide(             
        color: kSecondaryColor,
        width: 2.0,
      ), )
           
                
  ), 
                 height: 60,
                 width: Sizec.screenWidth,
                  child: Center(child: Text("TOTAL 00.000",style:TextStyle(color:kPrimaryColor,fontSize: 15,fontWeight:FontWeight.w600 ))),
)
                  
               

               
                 
        
               
                 ],
               ), 
           ),
                ),
              ],
            ),
       

      ],) ,
          bottomNavigationBar:BannerSho(),

    );
       
    
  }
}

 class BtnDetalles extends StatelessWidget {
   const BtnDetalles({
     Key key,
    this.text,
    this.press,
    this.color
   }) : super(key: key);

   final String text;
   final Function press;
   final Color color;

  @override
   Widget build(BuildContext context) {
     return  Container(
           padding: EdgeInsets.only(left: 25,right:25),
           child: SizedBox(
      width: Sizec.screenWidth/1,
      height: 30,
      child: FlatButton(
        color: color,
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
             ),
        onPressed: press,
        child:  Row(
          mainAxisAlignment : MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
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