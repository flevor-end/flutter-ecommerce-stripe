import 'package:flutter/material.dart';



class Categoriastitle extends StatelessWidget {
  const Categoriastitle({
    Key key,
    this.text,
    this.customColor,
    this.customFontColor
    // this.isColor = false,
  }) : super(key: key);

  final String text;
  final Color customColor;
  final Color customFontColor;

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: customFontColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic
        ),
      ),
      decoration: BoxDecoration(
        color: customColor,
      ),
    );
  }
}