
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/components/billetera_screen.dart';
import 'package:masdamas/components/qrcodigo.dart';
import 'package:masdamas/components/scannerone.dart';
import 'package:masdamas/components/share_screen.dart';
import 'package:masdamas/constants.dart';

import '../sizec.dart';
import 'compartir_screen.dart';

class DialogS extends StatefulWidget {
  @override
  _DialogSState createState() => _DialogSState();
}

class _DialogSState extends State< DialogS> {
 @override 
  Widget build(BuildContext context) {
   return Dialog(
      insetPadding: EdgeInsets.fromLTRB(210.0,Sizec.screenHeight>700?50:53, 1,Sizec.screenHeight>700?400:320),      
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
  dialogContent(BuildContext context) {
  return  new Container(
    height:Sizec.screenHeight>700?350:300,
    decoration: BoxDecoration(
    border: Border.all(color: kSecondaryColor,width: 3),
    borderRadius:BorderRadius.circular(4),
    color: Colors.white,
  ),
    
      child: Column(children: [
      BtnHome(image:"assets/icons/iconoscanner.svg",text:"Escanear",press: (){  showDialog(context: context, builder: (buildcontext) => QRViews());
  },),
      BtnHome(image:"assets/icons/iconoscodigoqr.svg",text:"Codigo QR",press: (){  showDialog(context: context, builder: (buildcontext) =>ScannerQr());
  },),
      BtnHome(image:"assets/icons/iconoagregar.svg",text:"Agregar",press: (){  showDialog(context: context, builder: (buildcontext) => Compart());
  },),
      BtnHome(image:"assets/icons/iconobilletera.svg",text:"Billetera",press: (){  showDialog(context: context, builder: (buildcontext) => Billet());
  },),
      BtnHome(image:"assets/icons/iconocompartir.svg",text:"Compartir MAS",press: (){  showDialog(context: context, builder: (buildcontext) => ShareScreen());
  }),
     ],
   )   
);
}
}
 class BtnHome extends StatelessWidget {
   const BtnHome({
     Key key,
    this.text,
    this.press,
    this.image,
   }) : super(key: key);

   final String text,image;
   final Function press;

  @override
   Widget build(BuildContext context) {
     return  GestureDetector(
       onTap: press,
       child:Container(

      padding:EdgeInsets.only(top:7,left:9),
      child: SizedBox(
      height: getProportionateScreenHeight(55),
      child:   Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    child: SvgPicture.asset(
                    image,
                    width: 40,
                    ),
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 13,
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

