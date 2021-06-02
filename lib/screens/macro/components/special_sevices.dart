import 'package:flutter/material.dart';
import 'package:masdamas/components/special_offert_card_small.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/home/components/section_title.dart';

class SpecialServices extends StatelessWidget {
  const SpecialServices({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Column(
        children: [
          SectionTitle(
            text: "SERVICIOS",
            press: () {},
            isColor: true,
          ),
          SizedBox(height: 5),
          SafeArea(
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                SpecialOfferCardSmall(
                  image: "assets/images/serv_recarga.jpg",
                  category: null,
                  numOfBrands: 18,
                  press: () {},
                  isFullcard: true,
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/serv_soporte.jpg",
                  category: null,
                  numOfBrands: 23,
                  press: () {},
                  isFullcard: true,
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/serv_reparacion.jpg",
                  category: null,
                  numOfBrands: 18,
                  press: () {},
                  isFullcard: true,
                ),
                SpecialOfferCardSmall(
                  image: "assets/images/serv_transmi.jpg",
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
