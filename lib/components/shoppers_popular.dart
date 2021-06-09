import 'package:flutter/material.dart';
import 'package:masdamas/routes.dart';
import 'package:masdamas/sizec.dart';

import '../constants.dart';

class ShoppersPopular extends StatelessWidget {
  const ShoppersPopular({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalUser = 0;
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenWidth(18),
      child: Stack(
        children: [
          // ...List.generate(products[0].users.length, (index) {
          //   totalUser++;
          //   return Positioned(
          //     bottom: (18 * index).toDouble(),
          //     child: buildShopperFace(index),
          //   );
          // }),
          Positioned(
            left: 10,
              child: buildShopperFace(index),
            ),
          Positioned(
            left: 30,
            child: SizedBox(
              height: getProportionateScreenWidth(18),
              width: getProportionateScreenWidth(18),
              child: FlatButton(
                
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: kSecondaryColor),
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.white,
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.person_add_rounded,
                      color: Colors.red,
                      size: 14,
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 50,
            child: SizedBox(
              height: getProportionateScreenWidth(18),
              width: getProportionateScreenWidth(18),
              child: FlatButton(
                
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: kSecondaryColor),
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.white,
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.person_add_rounded,
                      color: Colors.red,
                      size: 14,
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left:70,
            child: SizedBox(
              height: getProportionateScreenWidth(18),
              width: getProportionateScreenWidth(18),
              child: FlatButton(
                
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: kSecondaryColor),
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.white,
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.person_add_rounded,
                      color: Colors.red,
                      size: 14,
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ClipOval buildShopperFace(int index) {
    return ClipOval(
      child: Image.asset(
        "assets/images/Profile Image.png",
        // products[0].users[index].image,
        height: getProportionateScreenWidth(18),
        width: getProportionateScreenWidth(18),
        fit: BoxFit.cover,
      ),
    );
  }
}
