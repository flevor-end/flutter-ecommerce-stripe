import 'package:flutter/material.dart';
import 'package:masdamas/components/categoriastitle.dart';
import 'package:masdamas/screens/categories/components/offert_tecnology.dart';
import 'package:masdamas/screens/home/components/discount_banner.dart';
import 'package:masdamas/screens/shopping/components/categories.dart';
import 'package:masdamas/screens/shopping/components/section_tab.dart';


import 'categories_items.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      //color: kSecondaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DiscountCard(
              images: "assets/images/promoShopping.jpg",
            ),
            Categoriastitle(text: "TECNOLOGIA"),
            SectionTab(),
            CategoriesItems(),
            SizedBox(
              height: (5),
            ),
            Categorieso(0xFFFF710F),
            OffertTecnology()
          ],
        ),
      ),
    ));
  }
}
