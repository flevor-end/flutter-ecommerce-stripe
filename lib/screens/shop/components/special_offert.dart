import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SpecialOffertSmall extends StatelessWidget {
  const SpecialOffertSmall({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: kSecondaryColor,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SafeArea(
            child: Wrap(
              spacing: 10,
              runSpacing: 5,
              children: [
                SpecialOfferCardSmall(
                  image: "assets/images/oferta_shopping.jpeg",
                  category: null,
                  numOfBrands: 18,
                  press: () {},
                  
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/oferta_shopping_1.jpg",
                  category: null,
                  numOfBrands: 23,
                  press: () {},
                  
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/oferta_shopping_2.jpg",
                  category: null,
                  numOfBrands: 18,
                  press: () {},
                  
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/oferta_shopping_3.jpg",
                  category: null,
                  numOfBrands: 23,
                  press: () {},
                  
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class SpecialOfferCardSmall extends StatelessWidget {
  const SpecialOfferCardSmall({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
    
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;
 
 

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
            border: Border.all(width: 2, color: kShopColor)),
        child: SizedBox(
          width: SizeConfig.screenHeight * 0.11,
          
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              //alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}