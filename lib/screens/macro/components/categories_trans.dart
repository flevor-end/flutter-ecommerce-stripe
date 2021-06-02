import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/screens/home/components/section_title.dart';

class CategoriesTrans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/TRA1.svg", "text": "Escanear"},
      {"icon": "assets/icons/TRA2.svg", "text": "QR Code"},
      {"icon": "assets/icons/pesos.svg", "text": "Enviar"},
      {"icon": "assets/icons/TRA4.svg", "text": "Billetera"},
      //{"icon": "assets/icons/Discover.svg", "text": "mas"},
    ];

    return Column(
      children: [
        Container(
          height: 20,
          child: SectionTitle(
            text: "   TRANSACCIONES",
            isColor: false,
            press: () {},
          ),
        ),
        Padding(
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
                      ))
            ],
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
            height: 55,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.7,
                  child: Container(
                    padding: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        //color: kSecondaryColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(
                      icon,
                    ),
                  ),
                ),
                Text(text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
