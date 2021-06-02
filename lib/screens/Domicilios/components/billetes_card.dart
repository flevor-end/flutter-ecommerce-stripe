import 'package:flutter/material.dart';



class BilletesCard extends StatelessWidget {
  final String icon;
  
  final bool isDone;
  final Function press;
  const BilletesCard({
    Key key,
    this.isDone = false,
    this.icon,
    this.press,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        height: 34,
        width: size.width * 0.31,
        padding: EdgeInsets.only(left: 5),
        margin: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage("$icon"),
             fit:BoxFit.cover,  
           ),
            
         ),
      );
    });
  }
}
