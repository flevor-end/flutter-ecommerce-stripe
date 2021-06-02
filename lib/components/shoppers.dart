import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/sizec.dart';

class Shoppers extends StatelessWidget {
  const Shoppers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalUser = 0;
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenWidth(22),
      child: Stack(
        children: [
          // ...List.generate(demoProducts[0].users.length, (index) {
          //   totalUser++;
          //   return Positioned(
          //     left: (14 * index).toDouble(),
          //     child: buildShopperFace(index),
          //   );
          // }),
          Positioned(
            left: (15 * totalUser).toDouble(),
            child: SizedBox(
              height: getProportionateScreenWidth(22),
              width: getProportionateScreenWidth(22),
              child: FlatButton(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: kSecondaryColor,
                onPressed: () {},
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 18,
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
        //demoProducts[0].users[index].image,
        height: getProportionateScreenWidth(22),
        width: getProportionateScreenWidth(22),
        fit: BoxFit.cover,
      ),
    );
  }
}
