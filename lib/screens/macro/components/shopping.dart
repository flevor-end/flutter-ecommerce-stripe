import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/home/components/section_title.dart';
import 'package:masdamas/sizec.dart';

class Shopping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryColor,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 7),
            child: SectionTitle(
              text: "SHOPPING",
              press: () {},
              isColor: true,
            ),
          ),
          Container(
            height: 77,
            padding: EdgeInsets.only(bottom: 8),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    child: Container(
                  width: getProportionateScreenWidth(355),
                  height: 38,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 50,
                            color: Color(0xFF121530).withOpacity(0.2))
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10)),
                    child: Row(
                      //En Proceso
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      color: kSecondaryColor,
                                    ),
                                    children: [
                                  TextSpan(
                                      text: "EN PROCESO",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ))
                                ])),
                            SizedBox(
                              width: kDefaultPadding / 4,
                            ),
                            Container(
                                //padding: EdgeInsets.all(12),
                                height: 30,
                                width: 40,
                                child:
                                    SvgPicture.asset("assets/icons/SHO1.svg")),
                          ],
                        ),
                        //Enviado
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      color: kSecondaryColor,
                                    ),
                                    children: [
                                  TextSpan(
                                      text: "ENVIADO",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ))
                                ])),
                            SizedBox(
                              width: kDefaultPadding / 2,
                            ),
                            Container(
                                //padding: EdgeInsets.all(12),
                                height: 40,
                                width: 40,
                                child:
                                    SvgPicture.asset("assets/icons/SHO2.svg")),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
                //Compartido
                Positioned(
                  //left: (22 * totalUser).toDouble(),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(width: 1.8, color: Colors.white)),
                      child: FlatButton(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80),
                        ),
                        color: kPrimaryColor,
                        onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: getProportionateScreenWidth(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 18,
                                width: 18,
                                child: SvgPicture.asset(
                                    "assets/icons/COMPARTIDO.svg"),
                              ),
                              SizedBox(
                                height: kDefaultPadding / 4,
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      children: [
                                    TextSpan(
                                        text: "COMPARTIDO",
                                        style: TextStyle(
                                          fontSize: 7.5,
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ]))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
