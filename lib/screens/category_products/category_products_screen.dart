import 'package:masdamas/components/custom_bottom_navbar.dart';
import 'package:masdamas/models/Product.dart';

import 'package:flutter/material.dart';
import 'package:masdamas/screens/home/components/home_header.dart';

import '../../constants.dart';
import 'components/body.dart';
import 'components/body_category.dart';

class CategoryProductsScreen extends StatefulWidget {
  final ProductType productType;

  const CategoryProductsScreen({
    Key key,
    @required this.productType,
  }) : super(key: key);

  @override
  _CategoryProductsScreenState createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
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
      body: BodyProduct(
        productType: widget.productType,
      ),
      bottomNavigationBar:CustomBottomNavBar(color: false,color2: false,color3: true,),
    );
  }
}
