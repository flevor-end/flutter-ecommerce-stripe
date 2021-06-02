import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/accordian/gf_accordian.dart';
import 'package:masdamas/components/default_button.dart';

import '../../../constants.dart';

class PayBit extends StatelessWidget {
  final String price;
  final String priceShare;

  const PayBit({Key key, this.price, this.priceShare}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        GFAccordion(
          titleChild: Text("PAGO COMBINADO",textAlign: TextAlign.center,),
          contentChild: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.5, color: kSecondaryColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                        'MASPAY'
                      ),
                        Text(
                        price,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: kSecondaryColor),
                      ),
                    ]
                  )
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1.5, color: kSecondaryColor),left: BorderSide(width: 1.5, color: kSecondaryColor),right: BorderSide(width: 1.5, color: kSecondaryColor))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text(
                        'MASBIT'
                      ),
                        Text(
                        priceShare,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: kSecondaryColor),
                      ),
                    ]
                  )
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 203,
                  child: DefaultButton(
                      text: "COMPRA YA",
                      press: () {},
                      color: kPrimaryColor,
                    ),
                ),
              ],
            ),
          ),
          textStyle:
              TextStyle(color: kSecondaryColor, fontWeight: FontWeight.w600),
          collapsedIcon: SvgPicture.asset(
            'assets/icons/ScrollDownArrow_light.svg',
            color: kPrimaryColor,
            width: 12,
          ),
          expandedIcon: Icon(Icons.minimize)
        ),
      ]
    );
  }
}