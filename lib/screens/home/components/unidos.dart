import 'package:flutter/material.dart';

import 'package:masdamas/screens/custom_expansion_tile.dart' as custom;

import '../../../constants.dart';
import '../../../sizec.dart';


class Unidos extends StatelessWidget {
  static String routeName = 'shoppingTab';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      //color: kSecondaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
           Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              width: double.infinity,
              height: Sizec.screenHeight/4.2,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: kSecondaryColor),
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/unidos.jpg",
                  ),
                ),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
              SizedBox(height: 10),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Center(
                 child: Text( "Espacio en el cual nuestros miembros y socios estrategicos unimos fuerzas para promover actividades beneficas para nuestras comunidades", textAlign:TextAlign.center,  style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),),
               ),
             ),
             SizedBox(height: 20),
            Center(
              child: Text("PROYECTOS ACTIVOS",style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 19,
                          fontWeight: FontWeight.w700),),
            ),
              SizedBox(height: 20),
                   Container(

            child: custom.ExpansionTile(
            
              title:Text(
                    'UNIDOS POR LOS ARBOLES',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                
          
              children: <Widget>[

               Column(
                 children: [
                   Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              width: double.infinity,
              height: Sizec.screenHeight/4.2,
              decoration: BoxDecoration(
                    border: Border.all(width: 2, color: kSecondaryColor),
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/unidos1.jpg",
                      ),
                    ),
              ),
              child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
              ),
            ),
            SizedBox(height: 10,),
             Text( 
                    'Nuestros miembros tienen la opción de sembrar un árbol virtual, nutrirlo diariamente, presenciar su crecimiento, y tener la experiencia de participar directamente/indirectamente a la siembra de su árbol en un terreno de tierra que tanto lo necesita.',
                    textAlign:TextAlign.center ,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                   SizedBox(height: 3,),

                   FlatButton(
        child: Text(
          'Conocer más sobre esta actividad…',
          style: TextStyle(
              color: kPrimaryColor,
              decoration: TextDecoration.underline,
              fontSize: 12),
        ),
        onPressed: () async {
         
        
        },
      ),

                 ],
               ),


              ]),),
                   Container(

            child: custom.ExpansionTile(
            
              title:Text(
                    'UNIDOS POR LOS NIÑOS',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                
          
              children: <Widget>[
              
                  Column(
                 children: [
                   Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              width: double.infinity,
              height: Sizec.screenHeight/4.2,
              decoration: BoxDecoration(
                    border: Border.all(width: 2, color: kSecondaryColor),
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/unidos2.jpg",
                      ),
                    ),
              ),
              child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
              ),
            ),
            SizedBox(height: 10,),
             Center(
              child: Text("LIBROS",style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),),
            ),
            SizedBox(height: 10,),
             Text( 
                    'Nuestros miembros pueden donar libros nuevos, usados, y/o intercambiar sus Puntos MAS a cambio de libros que serán entregados a los niños del país que tanto lo necesitan. ',
                    textAlign:TextAlign.center ,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                   SizedBox(height: 3,),

                   FlatButton(
        child: Text(
          'Conocer más sobre esta actividad…',
          style: TextStyle(
              color: kPrimaryColor,
              decoration: TextDecoration.underline,
              fontSize: 12),
        ),
        onPressed: () async {
         
        
        },
      ),
          Center(
              child: Text("ROPA",style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),),
            ),
            SizedBox(height: 7,),

               Text( 
                    'Nuestros miembros pueden donar ropa nueva, usada, y/o intercambiar sus Puntos MAS para su compra y posterior entrega a los niños del país que tanto lo necesitan.',
                    textAlign:TextAlign.center ,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),

                   FlatButton(
        child: Text(
          'Conocer más sobre esta actividad…',
          style: TextStyle(
              color: kPrimaryColor,
              decoration: TextDecoration.underline,
              fontSize: 12),
        ),
        onPressed: () async {
         
        
        },
      ),
        SizedBox(height: 7,),
         Center(
              child: Text("JUGUETES",style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),),
            ),
            SizedBox(height: 7,),

               Text( 
                    'Nuestros miembros pueden donar juguetes nuevos, usados, y/o intercambiar sus Puntos MAS para su compra y posterior entrega a los niños del país que tanto lo necesitan. ',
                    textAlign:TextAlign.center ,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),

                   FlatButton(
        child: Text(
          'Conocer más sobre esta actividad…',
          style: TextStyle(
              color: kPrimaryColor,
              decoration: TextDecoration.underline,
              fontSize: 12),
        ),
        onPressed: () async {
         
        
        },
      ),
       SizedBox(height: 7,),


                 ],
               ),

              ]),),     Container(

            child: custom.ExpansionTile(
             
              title:Text(
                    'UNIDOS POR NUESTRA GENTE',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight:FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                
          
              children: <Widget>[


                Column(
                 children: [
                   Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              width: double.infinity,
              height: Sizec.screenHeight/4.2,
              decoration: BoxDecoration(
                    border: Border.all(width: 2, color: kSecondaryColor),
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/unidos3.jpg",
                      ),
                    ),
              ),
              child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
              ),
            ),
            SizedBox(height: 10,),
             Text( 
                    'Nuestro país tiene una multitud de personas que pueden beneficiarse directamente de tu generosidad al donar objetos útiles que no estén siendo utilizados y puedan ser aprovechados por personas que carecen de los recursos necesarios para adquirirlos. ',
                    textAlign:TextAlign.center ,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                   SizedBox(height: 3,),

                   FlatButton(
        child: Text(
          'Conocer más sobre esta actividad…',
          style: TextStyle(
              color: kPrimaryColor,
              decoration: TextDecoration.underline,
              fontSize: 12),
        ),
        onPressed: () async {
         
        
        },
      ),

                 ],
               ),



              ]),),


          ],
        ),
      ),
    ),

          ],
        ),
      ),
    ));
  }
}