import 'package:flutter/material.dart';
import 'package:masdamas/components/special_offert_card_small.dart';
import 'package:masdamas/screens/home/components/section_title.dart';

class SpecialOffertDomi extends StatelessWidget {
  const SpecialOffertDomi({
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
          SectionTitle(
            text: "DOMICILIOS",
            press: () {},
            isColor: false,
          ),
          SizedBox(height: 5),
          SafeArea(
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                SpecialOfferCardSmall(
                  image: "assets/images/domi01.jpg",
                  category: null,
                  numOfBrands: 18,
                  press: () {},
                  isFullcard: true,
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/domi02.png",
                  category: null,
                  numOfBrands: 23,
                  press: () {},
                  isFullcard: true,
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/domi03.jpg",
                  category: null,
                  numOfBrands: 18,
                  press: () {},
                  isFullcard: true,
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/domi04.png",
                  category: null,
                  numOfBrands: 23,
                  press: () {},
                  isFullcard: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
