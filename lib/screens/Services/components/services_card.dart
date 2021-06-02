import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/products/products_screen.dart';

class ServicesCard extends StatelessWidget {
  final String shoppingCardNum;
  final bool isDone;
  final Function press;
  const ServicesCard({
    Key key,
    this.isDone = false,
    this.press,
    this.shoppingCardNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: size.width * 0.31,
            height: size.height * 0.055,
            decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: Color(0xFFF5B300)),
                //color: kSecondaryColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 17),
                    blurRadius: 23,
                    spreadRadius: -13,
                    color: Color(0xFFf3f3f3).withOpacity(0.4),
                  )
                ]),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductCategoryScreen(
                            //icon: icon, shoppingCardNum: shoppingCardNum

                            ),
                      ));
                },
                //{
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ProductCategoryScreen(
                //           icon: icon, shoppingCardNum: shoppingCardNum),
                //     ));
                //},
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Container(
                      //   height: 26,
                      //   child: SvgPicture.asset("$icon",
                      //       width: size.width * 0.06, color: kSecondaryColor),
                      // ),
                      SizedBox(width: 10),
                      Text(
                        "$shoppingCardNum",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10,
                            color: kSecondaryColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
