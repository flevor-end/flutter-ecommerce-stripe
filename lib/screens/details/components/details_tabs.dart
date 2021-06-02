import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/components/shoppers.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/models/Product.dart';

import 'icons_details.dart';

class DetailsTabs extends StatelessWidget {
  const DetailsTabs({
    Key key,
    @required this.size,
    @required this.product,
  }) : super(key: key);

  final Size size;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: size.width * 0.3,
            child: Shoppers(),
            ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 7),
          width: size.width * 0.3,
          decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 1.5, color: kSecondaryColor))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/AB4.svg",color: kSecondaryColor, width: 18,),
              SizedBox(width: 5),
              Text(
                "COMPARTIR",
                style:
                TextStyle(fontSize: 12, color: kSecondaryColor),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: size.width * 0.3,
          decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 1.5, color: kSecondaryColor))
          ),
          child: IconsDetail(
            product: product,
            icon: "assets/icons/Heart Icon_2.svg",
            text: "ME GUSTA",
            ),
        ),
      ],
    );
  }
}