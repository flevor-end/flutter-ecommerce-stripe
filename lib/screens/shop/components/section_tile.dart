import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';

import '../../../size_config.dart';

class SectionTile extends StatelessWidget {
  final String title;
  final GestureTapCallback press;
  const SectionTile({
    Key key,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kSecondaryColor,
          fontSize: getProportionateScreenWidth(18),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
