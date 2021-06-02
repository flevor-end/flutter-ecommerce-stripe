import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:masdamas/constants.dart';

class SectionTab extends StatelessWidget {
  const SectionTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/RE3.svg", "text": "Promos"},
      {"icon": "assets/icons/puntos.svg", "text": "Puntos"},
      {"icon": "assets/icons/RE4.svg", "text": "Historial"},
      {"icon": "assets/icons/categodomi4.svg", "text": "¡Unete Ya!"},
      //{"icon": "assets/icons/ICO1.svg", "text": "Mundo"},
    ];

    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                    categories.length,
                    (index) => CategoryCard(
                          icon: categories[index]["icon"],
                          text: categories[index]["text"],
                          press: () {},
                          isColor: false,
                        ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
    @required this.isColor = false,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;
  final bool isColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 2.3,
              child: Container(
                padding: EdgeInsets.only(top: 9, bottom: 1),
                decoration: BoxDecoration(
                    //color: kSecondaryColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(icon),
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: isColor ? kPrimaryColor : kSecondaryColor),
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
