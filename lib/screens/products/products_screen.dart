import 'package:flutter/material.dart';
import 'package:masdamas/components/custom_bottom_navbar.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/home/components/home_header.dart';

import '../category_products/components/body_category.dart';
class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({
    Key key,
    this.icon,
    this.shoppingCardNum,
  }) : super(key: key);

  final String icon;
  final String shoppingCardNum;

  @override
  _ProductCategoryScreenState createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        centerTitle: true,
        leading: Container(),
        //title: Text(widget.shoppingCardNum),
        flexibleSpace: HomeHeader(),
      ),
      //body: BodyProduct(0xFFFF710F),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
