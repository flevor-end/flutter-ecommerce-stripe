
import 'package:flutter/material.dart';
import 'package:masdamas/screens/custom_expansion_tile.dart' as custom;

import '../../../constants.dart';
import '../../../sizec.dart';


class Oportunidades extends StatelessWidget {
  static String routeName = 'shoppingTab';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      //color: kSecondaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
      SizedBox(height: 10,),
      Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              width: double.infinity,
              height: Sizec.screenHeight/4.2,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: kSecondaryColor),
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                     "assets/images/oportunidades.jpg",
                  ),
                ),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
             SizedBox(height: 18),
            Center(
              child: Text("OPORTUNIDADES",style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),),

            ),
            SizedBox(height: 18),
                   Container(

            child: custom.ExpansionTile(
              // leading: CircleAvatar(
              //     backgroundColor: Colors.green.withOpacity(.13),
              //     child: Icon(
              //       Icons.card_giftcard,
              //       color: Colors.green,
              //     )),
              title:Text(
                    'OFERTAS DE EMPLEO-MASDAMAS',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.7,
                    ),
                  ),
                
          
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(left:15,right:10),
                  child: Column(
                    children: [
                      Text( 
                          'Nuestro empresa siempre esta a la búsqueda de personas que compartan nuestros valores y deseen unirse a nuestro equipo.',
                          textAlign:TextAlign.justify,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 20,),

                    ],
                  ),
                ),

                BtnOportunidades(text: "COMPARTE TU CV",letra: 13,),
                 SizedBox(height: 10,),


              ]),),
                   Container(

            child: custom.ExpansionTile(
              // leading: CircleAvatar(
              //     backgroundColor: Colors.green.withOpacity(.13),
              //     child: Icon(
              //       Icons.card_giftcard,
              //       color: Colors.green,
              //     )),
              title:Text(
                    'OFERTAS DE EMPLEO',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                
          
              children: <Widget>[
                    Padding(
                  padding: const EdgeInsets.only(left:15,right:10),
                  child: Column(
                    children: [
                      Text( 
                          'Inscribe tu empresa y publica gratis tus ofertas laborables para ver vistas por todos nuestros miembros.',
                          textAlign:TextAlign.justify,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 20,),

                    ],
                  ),
                ),

                BtnOportunidades(text:"VER LISTA DE OFERTAS\n DE EMPLEO",letra: 11,press: (){},),
                 SizedBox(height: 10,),
              ]),),     Container(

            child: custom.ExpansionTile(
              // leading: CircleAvatar(
              //     backgroundColor: Colors.green.withOpacity(.13),
              //     child: Icon(
              //       Icons.card_giftcard,
              //       color: Colors.green,
              //     )),
              title:Text(
                    'ANUNCIA TU DISPONIBLIDAD PROFESIONAL',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                
          
              children: <Widget>[
                     Padding(
                  padding: const EdgeInsets.only(left:15,right:10),
                  child: Column(
                    children: [
                       SizedBox(height: 10,),
                      Text( 
                          'Publica gratis tu perfil profesional para que nuestros miembros y aliados puedan conocerte. ',
                          textAlign:TextAlign.justify,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 20,),

                    ],
                  ),
                ),

                BtnOportunidades(text: 'PUBLICAR Y VER OFERTAS \n DE EMPLEO',letra: 10.2,press: (){},),
                 SizedBox(height: 10,),
              ]),),
                Container(

            child: custom.ExpansionTile(
              // leading: CircleAvatar(
              //     backgroundColor: Colors.green.withOpacity(.13),
              //     child: Icon(
              //       Icons.card_giftcard,
              //       color: Colors.green,
              //     )),
              title:Text(
                    'MADRES CABEZA DE HOGAR',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                
          
              children: <Widget>[
                    Padding(
                  padding: const EdgeInsets.only(left:10,right:10),
                  child: Column(
                    children: [
                      Text( 
                          'Oportunidades de empleo para mujeres que asumen la enorme responsabilidad de proveer por su familia y crear un hogar para sus hijos.',
                          textAlign:TextAlign.justify,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 20,),

                    ],
                  ),
                ),

                BtnOportunidades(text: "INSCRIETE PARA RECIBIR \n INFORMACION SOBRE EMPLEOS",letra: 8.4,press: (){},),
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

class BtnOportunidades extends StatelessWidget {
   const BtnOportunidades({
     Key key,
    this.text,
    this.press,
    this.width,
    this.left,
    this.rigth,
    this.letra
   }) : super(key: key);

   final String text;
   final Function press;
   final double width,left,rigth,letra;

  @override
   Widget build(BuildContext context) {
     return  Container(
           padding: EdgeInsets.only(left: 1,right:1),
           child: SizedBox(
      width: Sizec.screenWidth/2.17,
      height: getProportionateScreenHeight(42),
      child: FlatButton(
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
              side: BorderSide(width: 1.5, color: kSecondaryColor)),
        onPressed: press,
        child:  Row(
          mainAxisAlignment : MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: letra,
                      color: kPrimaryColor,
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
