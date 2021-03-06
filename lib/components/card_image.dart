import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardImage extends StatelessWidget {
  String pathImage = "assets/hogar.jpg";

  CardImage(this.pathImage);

  @override
  Widget build(BuildContext context) {
  final card = Container(
      height: 80.0,
      width: 80.0,
      margin: EdgeInsets.only(
        top: 30.0,
        left: 20.0,
      ),
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );

    return card;
  }
}
