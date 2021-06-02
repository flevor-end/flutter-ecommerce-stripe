import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/sizec.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.text,
    @required this.press,
    this.isColor = false,
  }) : super(key: key);

  final String text;
  final bool isColor;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 20,
            padding: EdgeInsets.all(getProportionateScreenWidth(2.5)),
            width: getProportionateScreenWidth(120),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: isColor ? Colors.white : kSecondaryColor,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: isColor ? Colors.white : kSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
