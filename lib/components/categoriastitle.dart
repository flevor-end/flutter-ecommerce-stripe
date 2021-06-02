import 'package:flutter/material.dart';



class Categoriastitle extends StatelessWidget {
  const Categoriastitle({
    Key key,
    this.text,
    this.customColor,
    // this.isColor = false,
  }) : super(key: key);

  final String text;
  final Color customColor;

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontFamily: "Roboto",
        ),
      ),
      decoration: BoxDecoration(
        color: customColor,
      ),
    );
  }
}
