import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/home/components/section_title.dart';

class ToTheHand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/ALAMANO1.svg", "text": "MI AGENDA"},
      {"icon": "assets/icons/ALAMANO2.svg", "text": "TRANSPORTE \nPUBLICO"},
      {"icon": "assets/icons/ALAMANO3.svg", "text": "TRANSPORTE \nPRIVADO"},
      {"icon": "assets/icons/ALAMANO4.svg", "text": "DOMICILIOS"},
      //{"icon": "assets/icons/Discover.svg", "text": "mas"},
    ];

    return Column(
      children: [
        SectionTitle(
          text: "A LA MANO",
          press: () {},
          isColor: false,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                  categories.length,
                  (index) => ToTheHandCard(
                        icon: categories[index]["icon"],
                        text: categories[index]["text"],
                        press: () {},
                      ))
            ],
          ),
        ),
      ],
    );
  }
}

class ToTheHandCard extends StatelessWidget {
  const ToTheHandCard({
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
            width: 85,
            height: 69,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.9,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        //color: kPrimaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        border: Border.all(width: 1.5, color: kSecondaryColor)),
                    child: SvgPicture.asset(
                      icon,
                      //color: kPrimaryColor,
                    ),
                  ),
                ),
                //const SizedBox(height: 5),
                Container(
                  width: 85,
                  height: 24,
                  //color: kSecondaryColor,
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 9.5,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
