import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/models/Product.dart';
import 'package:masdamas/routes.dart';

class ProductSize extends StatefulWidget {
  final Product product;
  final Function(String) onselected;
  ProductSize({this.product, this.onselected});

  @override
  _ProductSizeState createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  int _selectedSize = 0;

  String _selectedproductSize = "0";



  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (var i = 0; i < widget.product.size.length; i++)
        GestureDetector(
          onTap: () {
            widget.onselected("\n${widget.product.size[i]} ");
            setState(() {
              _selectedSize = i;
            });
          },
          child: Container(
              width: 42.0,
              height: 42.0,
              decoration: BoxDecoration(
                color: _selectedSize == i ? kSecondaryColor : Color(0xFFDCDCDC),
                borderRadius: BorderRadius.circular(8.0),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                "${widget.product.size[i]} ",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: _selectedSize == i ? Colors.white : Colors.black,
                ),
              )),
        )
    ]);
  }
}