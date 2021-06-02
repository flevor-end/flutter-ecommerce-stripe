import 'package:flutter_svg/svg.dart';
import 'package:masdamas/components/rounded_icon_button.dart';
import 'package:masdamas/components/search_field.dart';
import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/products/components/products_filter.dart';

import '../../../components/icon_button_with_counter.dart';

class HomeHeader extends StatelessWidget {
  final Function onSearchSubmitted;
  final Function onCartButtonPressed;
  const HomeHeader({
    Key key,
    @required this.onSearchSubmitted,
    @required this.onCartButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // RoundedIconButton(
        //     iconData: Icons.menu,
        //     press: () {
        //       Scaffold.of(context).openDrawer();
        //     }),
        Expanded(
          child: SearchField(
            onSubmit: onSearchSubmitted,
          ),
        ),
        SizedBox(width: 5),
        IconButtonWithCounter(
          svgSrc: "assets/icons/filtro.svg",
          numOfItems: 0,
          press: () {
          showDialog(
            context: context, 
            builder: (buildcontext) => ProductFilter());},
        ),
        SizedBox(width: 5),
        // IconButtonWithCounter(
        //   svgSrc: "assets/icons/Cart Icon.svg",
        //   numOfItems: 3,
        //   press: onCartButtonPressed,
        // ),
      ],
    );
  }
}
