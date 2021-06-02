
import 'package:flutter/material.dart';
import 'package:masdamas/screens/custom_expansion_tile.dart' as custom;

import '../../../constants.dart';
import '../../../sizec.dart';


class Nosotros extends StatelessWidget {
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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 12,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              width: 400,
              height: Sizec.screenHeight/4.3,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: kSecondaryColor),
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                  'assets/images/nosotros.jpg',
                  ),
                ),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
              Container(

            child: custom.ExpansionTile(
             
              title:Text(
                    'SOMOS',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                
          
              children: <Widget>[

               Text(
                    'Una plataforma interactiva que promueve la comercialización de productos y servicios de calidad, actividades enriquecedoras y el intercambio de ideas positivas.',
                    style: TextStyle(
                      color:Colors.grey[400],
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),

              ]),),
                 Container(

            child: custom.ExpansionTile(
            
              title:Text(
                    'CREAMOS',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                
          
              children: <Widget>[
              
              Text(
                    'Un espacio virtual seguro y positivo donde nuestros miembros pueden participar simultáneamente como cliente, proveedor, miembro de equipo, comunicador, y/o audiencia. ',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),

              ]),),   
               Container(

            child: custom.ExpansionTile(
           
              title:Text(
                    'VISION',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                
          
              children: <Widget>[
                 Text(
                    'Unidos podemos progresar y generar cambios positivos para nuestros miembros y sociedades.',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),


              ]),),
              
              
              Container(

            child: custom.ExpansionTile(
             
       
              title:Text(
                    'MISION',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                
          
              children: <Widget>[
              
               Text(
                    'Apoyar al individuo para fortalecer al grupo… Unidos.',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),

                
              ]),),     Container(

            child: custom.ExpansionTile(
           
              title:Text(
                    'VALORES',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                
          
              children: <Widget>[

                     Text(
                    'Honestidad, generosidad, humildad, dedicación, valentía y compromiso.',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),

              ]),),   Container(

            child: custom.ExpansionTile(
             
              title:Text(
                    'POLITICAS DE CALIDAD',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                
          
              children: <Widget>[

              
                     Text(
                    'Exigimos lo mejor de nosotros, nuestros miembros y terceros que deseen promover sus productos o servicios en nuestra plataforma con el fin de generar experiencias y transacciones positivas para todos.',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),

              ]),),   Container(

            child: custom.ExpansionTile(
            
              title:Text(
                    'RESPONSABILIDAD SOCIAL',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                
          
              children: <Widget>[


                Text(
                    'Aportar positivamente a nuestra sociedad con acciones concretas.',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),


              ]),),   Container(

            child: custom.ExpansionTile(
             
              title:Text(
                    'RESPONSABILIDAD AMBIENTAL',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                
          
              children: <Widget>[

                     Text(
                    'Es nuestro deseo y deber de participar de manera proactiva en actividades que protejan el medio ambiente.',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),

                  SizedBox(height: 20,),


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