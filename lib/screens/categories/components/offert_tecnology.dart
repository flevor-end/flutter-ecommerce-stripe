import 'package:flutter/material.dart';
import 'package:masdamas/components/special_offert_card_small.dart';

class OffertTecnology extends StatelessWidget {
  const OffertTecnology({
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
                  image: "assets/images/tecnologia.webp",
                  category: null,
                  numOfBrands: 18,
                  press: () {},
                  isFullcard: false,
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/tecnologia02.jpg",
                  category: null,
                  numOfBrands: 23,
                  press: () {},
                  isFullcard: false,
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/tecnologia03.png",
                  category: null,
                  numOfBrands: 18,
                  press: () {},
                  isFullcard: false,
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/tecnologia04.jpg",
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
