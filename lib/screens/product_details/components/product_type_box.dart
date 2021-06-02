import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductTypeBox extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onPress;
  const ProductTypeBox({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(
            horizontal: 4,
          ),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            //color: kShopColor.withOpacity(0.09),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: kShopColor.withOpacity(1.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                  child: SvgPicture.asset(
                    icon,
                    width: getProportionateScreenWidth(20),
                    height: getProportionateScreenWidth(17),
                    //color: kPrimaryColor,
                  ),
              ),
              Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: getProportionateScreenHeight(12),
                  fontWeight: FontWeight.w900,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        
      ),
    );
  }
}
