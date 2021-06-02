


import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../sizec.dart';

class BtnContinuar extends StatelessWidget {
   const BtnContinuar({
     Key key,
    this.text,
    this.press,
    this.width,
    this.letra
   }) : super(key: key);

   final String text;
   final Function press;
   final double width,letra;

  @override
   Widget build(BuildContext context) {
     return  Container(
           padding: EdgeInsets.only(left: 1,right:1),
           child: SizedBox(
      width: Sizec.screenWidth/2,
      height: 45,
      child: FlatButton(
        color: kSecondaryColor,
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
              side: BorderSide(width: 2, color: kSecondaryColor)),
        onPressed: press,
        child:  Row(
          mainAxisAlignment : MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: letra,
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

 class BtnDevoluciones extends StatelessWidget {
   const BtnDevoluciones({
     Key key,
    this.text,
    this.press,
    this.width,
    this.letra
   }) : super(key: key);

   final String text;
   final Function press;
   final double width,letra;

  @override
   Widget build(BuildContext context) {
     return  Container(
           padding: EdgeInsets.only(left: 1,right:1),
           child: SizedBox(
      width: Sizec.screenWidth/2,
      height: 45,
      child: FlatButton(
        color: kPrimaryColor,
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
                      fontSize: letra,
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