
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 16,
          ),
          child: Text('PRODUCTOS DESTACADOS', style: TextStyle(
            fontWeight: FontWeight.w700,
            
          ),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: SvgPicture.asset(
              "assets/icons/ScrollDownArrow_dark.svg",
              width: 12,
              color: kSecondaryColor,
              ),
          ),
          
        )
        // Padding(
        //   padding: EdgeInsets.only(
        //     right: 16,
        //   ),
        //   child: Text(
        //     'View All',
        //     style: TextStyle(fontSize: 12, color: kPrimaryColor),
        //   ),
        // )
      ],
    );
  }
}
