import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/accordian/gf_accordian.dart';

import '../../../constants.dart';

class DescriptionWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        GFAccordion(
            title: "DESCRIPCIÓN",
            content: "DESCRIPCIÓN",
            textStyle:
                TextStyle(color: kSecondaryColor, fontWeight: FontWeight.w600),
            collapsedIcon: SvgPicture.asset(
              "assets/icons/ScrollDownArrow_light.svg",
              color: kPrimaryColor,
              width: 18,
            ),
            expandedIcon: Icon(Icons.minimize)),
        GFAccordion(
            title: "ESPECIFICACIONES",
            content: "ESPECIFICACIONES",
            textStyle:
                TextStyle(color: kSecondaryColor, fontWeight: FontWeight.w600),
            collapsedIcon: SvgPicture.asset(
              "assets/icons/ScrollDownArrow_light.svg",
              color: kPrimaryColor,
              width: 18,
            ),
            expandedIcon: Icon(Icons.minimize)),
        GFAccordion(
            title: "MEDIDA Y PESO",
            content: "MEDIDA Y PESO",
            textStyle:
                TextStyle(color: kSecondaryColor, fontWeight: FontWeight.w600),
            collapsedIcon: SvgPicture.asset(
              "assets/icons/ScrollDownArrow_light.svg",
              color: kPrimaryColor,
              width: 18,
            ),
            expandedIcon: Icon(Icons.minimize)),
        GFAccordion(
            title: "GARANTIA",
            content: "GARANTIA",
            textStyle:
                TextStyle(color: kSecondaryColor, fontWeight: FontWeight.w600),
            collapsedIcon: SvgPicture.asset(
              "assets/icons/ScrollDownArrow_light.svg",
              color: kPrimaryColor,
              width: 18,
            ),
            expandedIcon: Icon(Icons.minimize)),
        GFAccordion(
            title: "DEVOLUCION",
            content: "DEVOLUCION",
            textStyle:
                TextStyle(color: kSecondaryColor, fontWeight: FontWeight.w600),
            collapsedIcon: SvgPicture.asset(
              "assets/icons/ScrollDownArrow_light.svg",
              color: kPrimaryColor,
              width: 18,
            ),
            expandedIcon: Icon(Icons.minimize)),
        GFAccordion(
            title: "RESPONSABILIDAD AMBIENTAL",
            content: "RESPONSABILIDAD AMBIENTAL",
            textStyle:
                TextStyle(color: kSecondaryColor, fontWeight: FontWeight.w600),
            collapsedIcon: SvgPicture.asset(
              "assets/icons/ScrollDownArrow_light.svg",
              color: kPrimaryColor,
              width: 18,
            ),
            expandedIcon: Icon(Icons.minimize)),
        GFAccordion(
            title: "CALIFICACION",
            content: "CALIFICACION",
            textStyle:
                TextStyle(color: kSecondaryColor, fontWeight: FontWeight.w600),
            collapsedIcon: SvgPicture.asset(
              "assets/icons/ScrollDownArrow_light.svg",
              color: kPrimaryColor,
              width: 18,
            ),
            expandedIcon: Icon(Icons.minimize)),
      ],
    );
  }
}