import 'package:flutter/material.dart';
import 'package:masdamas/models/Product.dart';

import '../constants.dart';

class ProductImages extends StatefulWidget {
    final Product product;
    ProductImages({this.product});
  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {

  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 35),
      height: 230.0,
      child: Stack(
        children: [
          PageView(
            onPageChanged: (num) {
              setState(() {
                _selectedPage = num;
              });
            },
            children: [
            for(var i=0; i < widget.product.images.length; i++)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: kSecondaryColor),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    widget.product.images[i],
                    //fit: BoxFit.cover,
                  ),
                )
              )
            ],
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(var i=0; i < widget.product.images.length; i++)
                AnimatedContainer(
                  duration: Duration(
                    milliseconds: 300
                  ),
                  curve: Curves.easeOutCubic,
                  margin: EdgeInsets.symmetric(
                    horizontal: 5.0
                  ),
                  width: _selectedPage == i ? 35.0 : 10.0,
                  height: 7.0,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12.0)
                  )
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}