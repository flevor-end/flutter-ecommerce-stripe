import 'package:flutter/material.dart';
import 'package:masdamas/models/Product.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ProductsColors extends StatefulWidget {
  const ProductsColors({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductsColorsState createState() => _ProductsColorsState();
}

class _ProductsColorsState extends State<ProductsColors> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              widget.product.images.length,
              (index) => buildSmallPreview(index),
            )
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: selectedImage == index
                    ? kPrimaryColor
                    : Colors.transparent)),
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }
}