import 'package:flutter/material.dart';
import 'package:masdamas/components/special_offert_card_small.dart';
import 'package:masdamas/screens/home/components/section_title.dart';

class SpecialProvecho extends StatelessWidget {
  const SpecialProvecho({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: kPrimaryColor,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Column(
        children: [
          SectionTitle(
            text: "PROVECHO",
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
                  image: "assets/images/prov_moto.jpg",
                  category: null,
                  numOfBrands: 18,
                  press: () {},
                  isFullcard: true,
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/prov_silla.jpg",
                  category: null,
                  numOfBrands: 23,
                  press: () {},
                  isFullcard: true,
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/prov_ps4.jpg",
                  category: null,
                  numOfBrands: 18,
                  press: () {},
                  isFullcard: true,
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/prov_mtb.jpg",
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
