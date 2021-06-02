import 'package:flutter/material.dart';

import '../constants.dart';

class  SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
   
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
    this.width = 67,
    this.isFullcard = false,
    @required this.description,
  }) : super(key: key);

  final String  image, description;
  final int numOfBrands;
  final GestureTapCallback press;
  final double width;
  final bool isFullcard;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 1, right: 1),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: isFullcard ? 170 : width,
          height: 93,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: kSecondaryColor),
                borderRadius: BorderRadius.circular(6)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: 170,
                    height: 180,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
