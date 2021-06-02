import 'package:flutter/material.dart';
import 'package:masdamas/components/special_offers_card.dart';
import 'package:masdamas/screens/home/components/screen_args.dart';

import '../../../sizec.dart';
import 'masdamas.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: Sizec.screenWidth,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          SafeArea(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                SpecialOfferCard(
                  image: "assets/images/1inicio.jpg",
                  
                  description:
                      'Comprar con amigos nunca ha \nsido tan lucrativo y divertido',
                  numOfBrands: 18,
                  press: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        Masdamas.routeName, (Route<dynamic> route) => false,
                        arguments: ScreenArguments(0));
                  },
                  isFullcard: true,
                ),
                SpecialOfferCard(
                  image: "assets/images/2inicio.jpg",
                  description:
                      'Cuando y donde quieras, con \neficiencia y sonrisa garantizada!',
                  numOfBrands: 23,
                  press: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        Masdamas.routeName, (Route<dynamic> route) => false,
                        arguments: ScreenArguments(1));
                  },
                  isFullcard: true,
                ),
                SpecialOfferCard(
                  image: "assets/images/3inicio.jpg",
                  description:
                      'Variedad de propuestas, soluciones \n practica y oportunidades...',
                  numOfBrands: 18,
                  press: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        Masdamas.routeName, (Route<dynamic> route) => false,
                        arguments: ScreenArguments(2));
                  },
                  isFullcard: true,
                ),
                SpecialOfferCard(
                  image: "assets/images/4inicio.jpg",
                  description:
                      'Gana, ahorra y cuida el planeta \n optimizando miles de productos...',
                  numOfBrands: 23,
                  press: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        Masdamas.routeName, (Route<dynamic> route) => false,
                        arguments: ScreenArguments(3));
                  },
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
