import 'package:flutter/material.dart';
import 'package:masdamas/components/categoriastitle.dart';
import 'package:masdamas/components/icons_tabs.dart';
import 'package:masdamas/components/titleSection.dart';
import 'package:masdamas/screens/Services/components/services_items.dart';
import 'package:masdamas/screens/Services/components/special_offert_small.dart';
import 'package:masdamas/screens/home/components/discount_banner.dart';
import 'package:masdamas/screens/shopping/components/categories.dart';


class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          DiscountCard(images: "assets/images/BANNER servicios.jpg"),
          SizedBox(
            height: size.height * 0.01,
           ),
          Categoriastitle(
            customColor: Color(0xFFF5B300),
            text:
                "Variedad de productos, soluciones \nprácticas y oportunidades",
          ),
          // SectionTab(),
          SizedBox(
            height: size.height * 0.01,
          ),
          ServiceItems(),
          SizedBox(
            height: size.height * 0.01,
           ),
           IconsTabs(0xFFF5B300),
          
          SpecialOffertSmall(),
          TitleSection(),
          
        ],
      ),
    ));
  }
}
