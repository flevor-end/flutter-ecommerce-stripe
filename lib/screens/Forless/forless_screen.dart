import 'package:flutter/material.dart';
import 'package:masdamas/components/categoriastitle.dart';
import 'package:masdamas/components/icons_tabs.dart';
import 'package:masdamas/components/titleSection.dart';
import 'package:masdamas/screens/Forless/components/forless_items.dart';
import 'package:masdamas/screens/Forless/components/special_offert.dart';
import 'package:masdamas/screens/home/components/discount_banner.dart';
import 'package:masdamas/screens/shopping/components/categories.dart';


class ForlessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          DiscountCard(images: "assets/images/4re.png"),
          SizedBox(
            height: size.height * 0.01,
          ),
          Categoriastitle(
              customColor: Color(0xFF008145),
              text:
                  "Gana, ahorra y cuida el planeta \noptimizando miles de productos..."),
          // SectionTab(),
          SizedBox(
            height:size.height * 0.01,
          ),
          ForlessItems(),
          SizedBox(
            height: size.height * 0.01,
          ),
          IconsTabs(0xFF008145),
          SpecialOffertSmall(),
          TitleSection(),
          
        ],
      ),
    ));
  }
}
