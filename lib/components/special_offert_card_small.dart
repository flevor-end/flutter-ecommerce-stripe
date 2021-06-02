import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';

class SpecialOfferCardSmall extends StatelessWidget {
  const SpecialOfferCardSmall({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
    this.width = 80,
    this.isFullcard = false,
    this.height = 80,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;
  final double width;
  final bool isFullcard;
  final double height;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 1.2,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: kSecondaryColor)),
        child: SizedBox(
          width: size.width * 0.21,
          height: size.width * 0.21,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              //alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //           begin: Alignment.topCenter,
                //           end: Alignment.bottomCenter,
                //           colors: [
                //         Color(0xFF343434).withOpacity(0.4),
                //         Color(0xFF343434).withOpacity(0.15),
                //       ])),
                // ),
                // Container(
                //   width: 120,
                //   height: 30,
                //   decoration: BoxDecoration(
                //       color: Colors.white70,
                //       borderRadius: BorderRadius.only(
                //           //topRight: Radius.circular(10),
                //           bottomRight: Radius.circular(10))),
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(
                //       vertical: 8,
                //       horizontal: 10,
                //     ),
                //     child: Text.rich(TextSpan(
                //         style: TextStyle(color: Colors.white),
                //         children: [
                //           TextSpan(
                //               text: "$category\n",
                //               style: TextStyle(
                //                   fontSize: 12,
                //                   fontWeight: FontWeight.bold,
                //                   color: kPrimaryColor)),
                //           //TextSpan(text: "$numOfBrands Marcas")
                //         ])),
                //   ),
                // ),
                // Positioned(
                //   top: 52,
                //   child: Container(
                //       width: 167,
                //       height: 34,
                //       decoration: BoxDecoration(
                //           color: Colors.black54,
                //           borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(10),
                //             topRight: Radius.circular(10),
                //           )),
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(
                //           vertical: 5.0,
                //         ),
                //         child: Text(
                //           'Comprar con amigos nunca ha \nsido tan lucrativo y divertido',
                //           style: TextStyle(color: Colors.white, fontSize: 9),
                //           textAlign: TextAlign.center,
                //         ),
                //       )),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
