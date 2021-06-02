import 'package:flutter/material.dart';
import 'package:masdamas/sizec.dart';

class ShoppersPopular extends StatelessWidget {
  const ShoppersPopular({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalUser = 0;
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenWidth(78),
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
            bottom: (18 * totalUser).toDouble(),
            child: SizedBox(
              height: getProportionateScreenWidth(18),
              width: getProportionateScreenWidth(18),
              child: FlatButton(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.white,
                onPressed: () {},
                child: Icon(
                  Icons.person_outlined,
                  color: Colors.red,
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
        // products[0].users[index].image,
        height: getProportionateScreenWidth(18),
        width: getProportionateScreenWidth(18),
        fit: BoxFit.cover,
      ),
    );
  }
}
