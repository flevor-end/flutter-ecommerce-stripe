import 'package:flutter/material.dart';
import 'package:masdamas/components/special_offert_card_small.dart';

class SpecialOffertSmall extends StatelessWidget {
  const SpecialOffertSmall({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: kSecondaryColor,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Column(
        children: [
          SafeArea(
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                SpecialOfferCardSmall(
                  image: "assets/images/oferta.jpeg",
                  category: null,
                  numOfBrands: 18,
                  press: () {},
                  isFullcard: false,
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/oferta01.jpg",
                  category: null,
                  numOfBrands: 23,
                  press: () {},
                  isFullcard: false,
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/oferta02.jpg",
                  category: null,
                  numOfBrands: 18,
                  press: () {},
                  isFullcard: false,
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/oferta03.jpg",
                  category: null,
                  numOfBrands: 23,
                  press: () {},
                  isFullcard: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
