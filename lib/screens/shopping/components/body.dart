import 'package:flutter/material.dart';
import 'package:masdamas/components/categoriastitle.dart';
import 'package:masdamas/components/titleSection.dart';
import 'package:masdamas/screens/home/components/discount_banner.dart';
import 'package:masdamas/screens/products/components/body_tab_subcategory.dart';
import 'package:masdamas/screens/shopping/components/special_offert_small.dart';
import 'categories.dart';
import 'shopping_items.dart';

class Body extends StatelessWidget {
  static String routeName = 'shoppingTab';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
      //color: kSecondaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DiscountCard(
              images: "assets/images/banner-shopping.jpg",
            ),
            SizedBox(
            height: size.height * 0.01,
           ),
            Categoriastitle(
                customColor: Color(0xFFFF710F),
                text:
                    "Comprar con amigos nunca ha \nsido tan lucrativo y divertido!"),
            //SectionTab(),
           SizedBox(
            height: size.height * 0.01,
           ),
            ShoppingItems(),
            SizedBox(
            height: size.height * 0.01,
            ),
            Categorieso(0xFFFF710F),
            SpecialOffertSmall(),
            TitleSection(),
          ],
        ),
      ),
    ));
  }
}
