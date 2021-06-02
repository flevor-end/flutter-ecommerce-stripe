
import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';


class BannerSho extends StatefulWidget {
   BannerSho({Key key}) : super(key: key);

  @override
  _BannerShoState createState() => _BannerShoState();
}

class _BannerShoState extends State<BannerSho> {
  @override
  Widget build(BuildContext context) {
    return Container(
       height: 40,
        decoration: new BoxDecoration(
          color: Colors.white,
          boxShadow: [
          BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
         ],
        ),

        child: Row(
          mainAxisAlignment : MainAxisAlignment.center,
          children: [

            Image.asset("assets/images/icono_servicio_cliente.png"),
            SizedBox(width: 5,),
            Text("SERVICIO AL CLIENTE",style:TextStyle(fontSize:12 ,fontWeight: FontWeight.w700,color:kSecondaryColor )),
          ],

        ),
    );
  }
}