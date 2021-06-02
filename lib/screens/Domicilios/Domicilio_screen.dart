import 'package:flutter/material.dart';
import 'package:masdamas/components/categoriastitle.dart';
import 'package:masdamas/components/icons_tabs.dart';
import 'package:masdamas/components/titleSection.dart';
import 'package:masdamas/screens/Domicilios/components/Special_offert_small.dart';
import 'package:masdamas/screens/home/components/discount_banner.dart';
import 'components/Domicilios_items.dart';
import 'package:masdamas/screens/shopping/components/categories.dart';

class DomicilioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
      //color: kSecondaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DiscountCard(images: "assets/images/BANNER DOMICILIOS.jpg"),
            SizedBox(
            height: size.height * 0.01,
           ),
            Categoriastitle(
                customColor: Color(0xFF744774),
                text:
                    "Cuando y donde quieras,  \ncon eficiencia y sonrisa garantizada!"),
            // SectionTab(),
            SizedBox(
            height: size.height * 0.01,
           ),
            DomiciliosItems(),
            SizedBox(
              height: (10),
            ),
            IconsTabs(0xFF744774),
            SpecialOffertSmall(),
            TitleSection(),
            
          ],
        ),
      ),
    ));
  }
}
