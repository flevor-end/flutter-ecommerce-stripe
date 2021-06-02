import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/screens/home/components/section_title.dart';

class Reward extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/RE1.svg", "text": "SORPRESAS"},
      {"icon": "assets/icons/RE3.svg", "text": "PROMOS"},
      {"icon": "assets/icons/celebrar.svg", "text": "CELEBRAR"},
      {"icon": "assets/icons/RE4.svg", "text": "EVENTOS"},
      //{"icon": "assets/icons/Discover.svg", "text": "mas"},
    ];

    return Container(
      //color: kPrimaryColor,
      child: Column(
        children: [
          SectionTitle(
            text: "MAS ME QUIERE",
            press: () {},
            isColor: false,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                    categories.length,
                    (index) => RewardCard(
                          icon: categories[index]["icon"],
                          text: categories[index]["text"],
                          press: () {},
                        ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RewardCard extends StatelessWidget {
  const RewardCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: press,
          child: SizedBox(
            width: 64,
            height: 42,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 2.18,
                  child: Container(
                    decoration: BoxDecoration(
                      //color: kSecondaryColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(10),
                      //border: Border.all(width: 1.5, color: kSecondaryColor)
                    ),
                    child: SvgPicture.asset(
                      icon,
                     
                    ),
                  ),
                ),
              
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight:FontWeight.bold, 
                   
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
