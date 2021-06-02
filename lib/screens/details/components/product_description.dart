import 'package:flutter/material.dart';
import 'package:masdamas/components/shoppers.dart';
import 'package:masdamas/models/Product.dart';
import '../../../constants.dart';
import 'icons_details.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.product,
    @required this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 5),
                    width: size.width * 0.67,
                    child: Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.67,
                    padding: EdgeInsets.only(left: 10,right: 5),
                      child: Text(
                        product.description,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                    ),
                  ),
                ],
              ),
            
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10,),
                  width: size.width * 0.303,
                  decoration: BoxDecoration(
                    border: Border(left: BorderSide(width: 1.5, color: kSecondaryColor), top: BorderSide(width: 1.5, color: kSecondaryColor), right: BorderSide(width: 1.5, color: kSecondaryColor))
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child:
                    Container(child: Text('ENTREGA 02 DIAS', style: TextStyle(fontSize: 10),), )
                  ),
                ),
                Container(
              padding: EdgeInsets.symmetric(vertical: 10,),
              width: size.width * 0.303,
              decoration: BoxDecoration(
                border: Border(left: BorderSide(width: 1.5, color: kSecondaryColor),top: BorderSide(width: 1.5, color: kSecondaryColor),right: BorderSide(width: 1.5, color: kSecondaryColor))
              ),
              child: 
              IconsDetail(
                          product: product,
                          icon: "assets/icons/categodomi3.svg",
                          text: "CARRITO",
                          ),
            ),
              ],
            ),
          ],
        ),
        
        // Padding(
        //   padding: EdgeInsets.symmetric(
        //     horizontal: 20,
        //     vertical: 10,
        //   ),
        //   child: GestureDetector(
        //     onTap: pressOnSeeMore,
        //     child: Row(
        //       children: [
        //         Text(
        //           "Ver mas",
        //           style: TextStyle(
        //               color: kPrimaryColor, fontWeight: FontWeight.w600),
        //         ),
        //         SizedBox(
        //           width: 5,
        //         ),
        //         Icon(
        //           Icons.arrow_forward_ios,
        //           size: 12,
        //           color: kPrimaryColor,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
