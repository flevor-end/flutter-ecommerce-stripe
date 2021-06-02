// import 'package:flutter/material.dart';
// import 'package:masdamas/components/rounded_icon_btn.dart';
// import 'package:masdamas/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/models/Product.dart';
import 'package:masdamas/routes.dart';

class ProductColors extends StatefulWidget {
  final Product product;
  final Function(String) onselected;
  ProductColors({this.product, this.onselected});

  @override
  _ProductColorsState createState() => _ProductColorsState();
}

class _ProductColorsState extends State<ProductColors> {
  int _selectedColors = 0;

  String _selectedproductColors = "0";



  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (var i = 0; i < widget.product.imagesColor.length; i++)
        GestureDetector(
          onTap: () {
            widget.onselected(widget.product.imagesColor[i]);
            setState(() {
              _selectedColors = i;
            });
          },
          child: Container(
              width: 62.0,
              height: 62.0,
              decoration: BoxDecoration(
                border: Border.all(color: _selectedColors == i ? kSecondaryColor : Color(0xFFDCDCDC)),
                //color: _selectedColors == i ? kSecondaryColor : Color(0xFFDCDCDC),
                borderRadius: BorderRadius.circular(8.0),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Image.network(
              widget.product.imagesColor[i],
              fit: BoxFit.contain,
            ),),
        )
    ]);
  }
}




