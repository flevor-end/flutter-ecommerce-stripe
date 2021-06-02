
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/constants.dart';

import '../sizec.dart';
import 'custom_bottom_navbar.dart';


class Billet extends StatefulWidget {
 Billet({Key key}) : super(key: key);

  @override
   BilletState createState() =>  BilletState();
}

class  BilletState extends State <Billet> {
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
Align(child: Text("BILLETERA",style:TextStyle(color:Colors.white,fontSize: 18,fontWeight:FontWeight.bold )),widthFactor: Sizec.screenWidth/130,),
],),),
SizedBox(height:Sizec.screenHeight>700 ?20:10,),    
Text("SELECCIONA-PAGA-GESTIONA",style:TextStyle(color: kSecondaryColor,fontSize: 16,fontWeight:FontWeight.bold )),
SizedBox(height:Sizec.screenHeight>700 ?20:10,),    
Container( 
  
  width: Sizec.screenWidth/1.08,
  height: 100,
  decoration: BoxDecoration(
    border: Border.all(color: kSecondaryColor,width: 2),
    borderRadius:BorderRadius.circular(10),
    color: Colors.white,
    
   
  ),
  
  child:Column(
    children: [

      Row(
     
     mainAxisAlignment: MainAxisAlignment.center ,
        children: [
        
         Image.asset(
        'assets/icons/icono_maspay.png',
         width: 50,
         height: 50,
        ),
        SizedBox(width: 55,),
           Align(
            heightFactor: 2,
              child: Text(
              "  MASPAY",
              style: TextStyle(
                color: kSecondaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              )
            ),
            
         ),
         SizedBox(width: 55,),
         Align(
            heightFactor: 2,
              child: Text(
              "  PAGO\nDIGITAL",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 13,
                fontWeight: FontWeight.bold
              )
            ),
         ),

      ],),
      Align(
        alignment: Alignment.bottomCenter,
        heightFactor: 0.91,
        child: Container( 
        width: Sizec.screenWidth/1.08,
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(color: kSecondaryColor,width: 2),
          borderRadius:BorderRadius.circular(7),
          color: kSecondaryColor,
          
         
        ),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
           
          Boton(shoppingCardNum: "Recibir",),
           SizedBox(width: 20,),
              Text(
                    "\$000.000",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                SizedBox(width: 20,),
                  Boton(shoppingCardNum: "Enviar",),

        ]),
        
        
        ),
      ),

    ],
  ),
  
  
  ),
  SizedBox(height:Sizec.screenHeight>700 ?20:12,),    

  Padding(
    padding: const EdgeInsets.only(left:12,right:12),
    child: Row( mainAxisAlignment: MainAxisAlignment.center ,children: [
    
    BotonBillet(icon:"assets/icons/icono_recargar.svg" ,shoppingCardNum: "Recargar",),
    SizedBox(width:12),
    BotonBillet(icon:"assets/icons/icono_retirar.svg" ,shoppingCardNum: "Retirar",),
    SizedBox(width:12),
    BotonBillet(icon:"assets/icons/icono_historial.svg" ,shoppingCardNum: "Historial",)

     

    ],),
  ),
   SizedBox(height:Sizec.screenHeight>700 ?20:12,),    
Container( 
  width: Sizec.screenWidth/1.08,
  height: 100,
  decoration: BoxDecoration(
    border: Border.all(color: kSecondaryColor,width: 2),
    borderRadius:BorderRadius.circular(10),
    color: Colors.white,
    
   
  ),
  
  child:Column(
    children: [

      Row(
     
     mainAxisAlignment: MainAxisAlignment.center ,
        children: [
        
         Image.asset(
        'assets/icons/icono_masbit.png',
         width: 50,
         height: 50,
        ),
        SizedBox(width: 58,),
           Align(
            heightFactor: 2,
              child: Text(
              "  MASBIT",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              )
            ),
            
         ),
         SizedBox(width: 58,),
         Align(
            heightFactor: 2,
              child: Text(
              " SUMA\nDIGITAL",
              style: TextStyle(
                color: kSecondaryColor,
                fontSize: 13,
                fontWeight: FontWeight.bold
              )
            ),
         ),

      ],),
      Align(
        alignment: Alignment.bottomCenter,
        heightFactor: 0.91,
        child: Container( 
        width: Sizec.screenWidth/1.08,
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(color: kSecondaryColor,width: 2),
          borderRadius:BorderRadius.circular(7),
          color: kSecondaryColor,
          
         
        ),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
           
          Boton(shoppingCardNum: "Recibir",),
           SizedBox(width: 45,),
              Text(
                    "0.000",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                SizedBox(width: 45,),
                  Boton(shoppingCardNum: "Enviar",),

        ]),
        
        
        ),
      ),

    ],
  ),
  
  
  ),

  SizedBox(height:Sizec.screenHeight>700 ?20:10,),    

  Padding(
    padding: const EdgeInsets.only(left:12,right:12),
    child: Row( mainAxisAlignment: MainAxisAlignment.center ,children: [
    
    BotonBillet(icon:"assets/icons/icono_libro.svg" ,shoppingCardNum: "Catalogo",),
    SizedBox(width:12),
    BotonBillet(icon:"assets/icons/icono_pendientes.svg" ,shoppingCardNum: "Pendientes",),
    SizedBox(width:12),
    BotonBillet(icon:"assets/icons/icono_historial.svg" ,shoppingCardNum: "Historial",)

     

    ],),
  ),
   SizedBox(height:Sizec.screenHeight>700 ?30:10,),    
   Text(
                    "MIS TARJETAS",
                    style: TextStyle(
                        fontSize: 15,
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold),
                  ),

    Text(
                    "2 Tarjetas Agregadas",
                    style: TextStyle(
                        fontSize: 11 ,
                        color: kSecondaryColor,
                        ),
                  ),  

                   SizedBox(height:Sizec.screenHeight>700 ?30:10,),    
   Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [

  Image.asset(
        'assets/images/tarjeta1.png',
         width: Sizec.screenWidth/2.05,
         height: 100,
         
        ), 
        SizedBox(width:Sizec.screenWidth>300?4:10,),
          Image.asset(
        'assets/images/tarjeta2.png',
         width: Sizec.screenWidth/2.05,
         height: 100,
        ), 



   ],),
  SizedBox(height:Sizec.screenHeight>700 ?35:10,),                 
  Padding(
    padding: const EdgeInsets.only(left:12,right:12),
    child: Row( mainAxisAlignment: MainAxisAlignment.center ,children: [
    
    BotonBillet(icon:"assets/icons/icono_recargar.svg" ,shoppingCardNum: "Recargar",),
    SizedBox(width:12),
    BotonBillet(icon:"assets/icons/icono_retirar.svg" ,shoppingCardNum: "Retirar",),
    SizedBox(width:12),
    BotonBillet(icon:"assets/icons/icono_historial.svg" ,shoppingCardNum: "Historial",)

     

    ],),
  ),
  
],
        ),
      bottomNavigationBar:  CustomBottomNavBar(color: false,color2: false,color3: false,),
          ),
    );
  }
}

class BotonBillet extends StatelessWidget {
  final String icon;
  final String shoppingCardNum;
  final bool isDone;
  final Function press;
  const BotonBillet({
    Key key,
    this.shoppingCardNum,
    this.isDone = false,
    this.icon,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        height: size.height* 0.05,
        width: size.width * 0.29,
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color:kSecondaryColor),
            //color: kSecondaryColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: Color(0xFFf3f3f3).withOpacity(0.4),
              )
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
           
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 26,
                    child: SvgPicture.asset("$icon",
                        width: size.width * 0.06),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "$shoppingCardNum",
                    style: TextStyle(
                        fontSize: 12,
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
class Boton extends StatelessWidget {
  final String icon;
  final String shoppingCardNum;
  final bool isDone;
  final Function press;
  const Boton({
    Key key,
    this.shoppingCardNum,
    this.isDone = false,
    this.icon,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        width: size.width * 0.22,
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color:Colors.white),
            //color: kSecondaryColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(4),
            color: Colors.white
        ),
       
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "$shoppingCardNum",
                    style: TextStyle(
                        fontSize: 15,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          
        );
      
    });
  }
}