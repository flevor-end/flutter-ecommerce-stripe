
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/screens/custom_expansion_tile.dart' as custom;

import '../../../constants.dart';
import '../../../sizec.dart';


class Soporte extends StatelessWidget {
  static String routeName = 'shoppingTab';
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Map<String, dynamic>> categories = [

      {"icon": "assets/icons/chat_soporte.svg", "text": "Chat En Linea"},
      {"icon": "assets/icons/mail_soporte.svg", "text": "Correo"},
      {"icon": "assets/icons/what_soporte.svg", "text": "Whatsapp"},
    ];
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
               SizedBox(height: 8,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              width: double.infinity,
              height: Sizec.screenHeight/4.3,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color:kSecondaryColor),
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                  'assets/images/soporte.png',
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
           Container(
            height: 25,
            width: Sizec.screenWidth,
            decoration: BoxDecoration(  border: Border.all(color: kPrimaryColor,), borderRadius: BorderRadius.all(
        Radius.circular(5.0) //                 <--- border radius here
    ), ),child:Align(child: Text("CANALES DE COMUNICACION",style:TextStyle(color:kSecondaryColor,fontSize: 15,fontWeight:FontWeight.w600)),widthFactor: Sizec.screenWidth/130,),
),
    SizedBox(height: 10),
    Container(
      child: Padding(
        padding: const EdgeInsets.only(left:10,right:10),
        child: Wrap(children: <Widget>[
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                    categories.length,
                    (index) => ComunicationCard (
                          icon: categories[index]["icon"],
                          text: categories[index]["text"],
                          customColor: kSecondaryColor,
                          press: () {},
                        ))
              ],
            ),
          ),
        ]),
      ),
    ),

         Container(
            height: 25,
            width: Sizec.screenWidth,
            decoration: BoxDecoration(  border: Border.all(color: kPrimaryColor,), borderRadius: BorderRadius.all(
        Radius.circular(5.0) //                 <--- border radius here
    ), ),child:Align(child: Text("PREGUNTAS FRECUENTES",style:TextStyle(color:kSecondaryColor,fontSize: 15,fontWeight:FontWeight.w600 )),widthFactor: Sizec.screenWidth/130,),
),
   Container(

            child: custom.ExpansionTile(
              // leading: CircleAvatar(
              //     backgroundColor: Colors.green.withOpacity(.13),
              //     child: Icon(
              //       Icons.card_giftcard,
              //       color: Colors.green,
              //     )),
              title:Text(
                    'SHOPPING',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                
          
              children: <Widget>[

               Column(
                 children: [
                   Container(

            child: custom.ExpansionTile(
              iconColor: Colors.grey[500],
             
              title:Text(
                        '¿Qué es Comprar Unidos?',
                        style: TextStyle(
                          color:Colors.grey[500],
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    
          
              children: <Widget>[

                   

              ]),),
                    Container(

            child: custom.ExpansionTile(
              iconColor: Colors.grey[500],
             
              title:Text(
                        '¿Con quien puedo hacer una Compra Unida?',
                        style: TextStyle(
                          color:Colors.grey[500],
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    
          
              children: <Widget>[

                   

              ]),),
                    Container(

            child: custom.ExpansionTile(
              iconColor: Colors.grey[500],
             
              title:Text(
                        '¿Cuales son los medios de pago permitidos?',
                        style: TextStyle(
                          color:Colors.grey[500],
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    
          
              children: <Widget>[

                   

              ]),),

      Container(

            child: custom.ExpansionTile(
              iconColor: Colors.grey[500],
             
              title:Text(
                        '¿Cómo hacer una devolución?',
                        style: TextStyle(
                          color:Colors.grey[500],
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    
          
              children: <Widget>[

                   

              ]),),





                 ],
               ),



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
                    'TRANSACCIONES',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                
          
              children: <Widget>[

                Column(
                 children: [
                   Container(

            child: custom.ExpansionTile(
              iconColor: Colors.grey[500],
             
              title:Text(
                        '¿Cómo enviar y recibir dinero?',
                        style: TextStyle(
                          color:Colors.grey[500],
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    
          
              children: <Widget>[

                   

              ]),),
                    Container(

            child: custom.ExpansionTile(
              iconColor: Colors.grey[500],
             
              title:Text(
                        '¿Cómo sacar dinero?',
                        style: TextStyle(
                          color:Colors.grey[500],
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    
          
              children: <Widget>[

                   

              ]),),
                    Container(

            child: custom.ExpansionTile(
              iconColor: Colors.grey[500],
             
              title:Text(
                        '¿Como administrar mi billetera?',
                        style: TextStyle(
                          color:Colors.grey[500],
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    
          
              children: <Widget>[

                   

              ]),),

      Container(

            child: custom.ExpansionTile(
              iconColor: Colors.grey[500],
             
              title:Text(
                        '¿Como pagar facturas?',
                        style: TextStyle(
                          color:Colors.grey[500],
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    
          
              children: <Widget>[

                   

              ]),),





                 ],
               ),





              ]),),
               SizedBox(height: 23),
              Container(
            height: 25,
            width: Sizec.screenWidth,
            decoration:BoxDecoration(  border: Border.all(color: kPrimaryColor,), borderRadius: BorderRadius.all(
        Radius.circular(5.0) //                 <--- border radius here
    ), ),child:Align(child: Text("MASPAY PAGO DIGITAL",style:TextStyle(color:kSecondaryColor,fontSize: 15,fontWeight:FontWeight.bold )),widthFactor: Sizec.screenWidth/130,),
),
       SizedBox(height: 20),

 
         Center(
           child: Image.asset(
        'assets/icons/icono_maspay.png',
           width: 105,
           height: 105,
        ),
         ),
         SizedBox(height: 10),
           Padding(
               padding: const EdgeInsets.all(8.0),
               child: Center(
                 child: Text( "Medio de pago digital que facilita la compra de productos y servicios en nuestra plataforma , en los espacios comerciales de nuestros miembros, ademas el intercambio entre miembros activos de nuestra plataforma  ", textAlign:TextAlign.center,  style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                            fontWeight: FontWeight.bold),),
               ),
             ),

               SizedBox(height: 10),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children:[

                 BotonSoporte (shoppingCardNum: "Terminos y Condiciones",),
                 SizedBox(width: 10),
                 BotonSoporte (shoppingCardNum: "Politicas de Privacidad",),
  
                 ]

               ),

               SizedBox(height: 15),
                
                Center(child:  GestureDetector(
      
        child: Container(
          
                 width: size.width * 0.48,
                 height: 33,
          decoration: BoxDecoration(
              
              //color: kSecondaryColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(4),
              color: kSecondaryColor
          ),
         
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Peticiones y Sugerencias",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
          ),
      ),),
                SizedBox(height: 15),


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


class ComunicationCard extends StatelessWidget {
  const ComunicationCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
    @required this.customColor,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;
  final Color customColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 85,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 2.4,
              child: Container(
                padding: EdgeInsets.only(top: 2, bottom: 7),
                child: SvgPicture.asset(
                  icon,
                  color: customColor,
                ),
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kSecondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
class BotonSoporte extends StatelessWidget {

  final String shoppingCardNum;
  final bool isDone;
  final Function press;
  const BotonSoporte({
    Key key,
    this.shoppingCardNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraint) {
      return GestureDetector(
        onTap: press,
        child: Container(
                 width: size.width * 0.45,
                 height: 33,
          decoration: BoxDecoration(  border: Border.all(color: kSecondaryColor,), borderRadius: BorderRadius.all(
        Radius.circular(5.0) //                 <--- border radius here
    ), ),
         
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "$shoppingCardNum",
                      style: TextStyle(
                          fontSize: 13,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
          ),
      );
      
    });
  }
}