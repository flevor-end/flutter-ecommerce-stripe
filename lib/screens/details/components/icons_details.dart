import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/models/Product.dart';

class IconsDetail extends StatelessWidget {
  const IconsDetail({
    Key key,
    @required this.product, this.icon, this.text,
  }) : super(key: key);

  final Product product;

  final String icon, text;

  @override
  Widget build(BuildContext context) {
    return Align(
    alignment: Alignment.centerRight,
    child: Container(
      //padding: EdgeInsets.all(15),
     
      // decoration: BoxDecoration(
      //     color:
      //         product.isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(20),
      //         bottomLeft: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            color:
                product.favourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
            width: 16,
          ),
          SizedBox(
            width: 5
          ),
          Text(
            text,
             style: TextStyle(
            fontSize: 11,
            color:
                product.favourite ? Color(0xFFFF4848) : kSecondaryColor,
          ),)
        ],
      ),
    ),
                      );
  }
}