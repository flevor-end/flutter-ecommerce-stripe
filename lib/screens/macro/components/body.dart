import 'package:flutter/material.dart';
import 'package:masdamas/components/categoriastitle.dart';
import 'package:masdamas/components/icons_tabs.dart';
import 'package:masdamas/components/titleSection.dart';
import 'package:masdamas/screens/Services/components/special_offert_small.dart';
import 'package:masdamas/screens/home/components/discount_banner.dart';
import 'package:masdamas/screens/shopping/components/categories.dart';
import 'package:masdamas/sizec.dart';
import '../../../constants.dart';
import 'macro_items.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DiscountCard(images: "assets/images/BANNER DOMICILIOS.jpg"),
            SizedBox(
              height: size.height * 0.01,
            ),
            Categoriastitle(
                customColor: Color(0xFF00369B),
                text:
                    "Buscar y ofrecer miles de productos \ncon rentabilidad para tu negocio."),
            SizedBox(
            height: size.height * 0.01,
           ),
            MacroItems(),
            SizedBox(
            height: size.height * 0.01,
            ),
            IconsTabs(0xFF00369B),
            SpecialOffertSmall(),
            TitleSection(),
          ],
        ),
      ),
    );
  }
}

class BtnMacro extends StatelessWidget {
  const BtnMacro({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FlatButton(
      minWidth: size.width * 0.93,
      
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(20),
          horizontal: getProportionateScreenWidth(20)),
      color: Color(0xFFF5B300),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          fontSize: 28,
          color: kSecondaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class DomiciliosItems {}
