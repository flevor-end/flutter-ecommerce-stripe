import 'package:getwidget/components/accordian/gf_accordian.dart';
import 'package:masdamas/components/share_screen.dart';
import 'package:masdamas/components/shoppers_popular.dart';
import 'package:masdamas/models/Product.dart';
import 'package:masdamas/screens/Cart/components/cart_item_card.dart';
import 'package:masdamas/screens/payments/payment_Screen.dart';
import 'package:masdamas/screens/checkout/checkout_screen.dart';
import 'package:masdamas/screens/details/components/User_bullet.dart';
import 'package:masdamas/screens/details/components/cart_counter.dart';
import 'package:masdamas/screens/product_details/components/color_dots.dart';
import 'package:masdamas/screens/product_details/components/product_actions_section.dart';
import 'package:masdamas/screens/product_details/components/product_size.dart';
import 'package:masdamas/screens/product_details/components/shared.dart';
import 'package:masdamas/screens/shop/components/precio_unidos.dart';
import 'package:masdamas/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import 'description_widget.dart';
import 'expandable_text.dart';
import 'fab.dart';


class ProductoDescripcion extends StatelessWidget {
    final Product product;
   final String productId;
   
  const ProductoDescripcion({
    Key key,
    @required this.product, this.productId,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String _selectedproductColors = "0";
    return Stack(
      children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  
                  children: [
                    Container(
                      width: SizeConfig.screenWidth * 0.6,
                      child: Text.rich(
                        TextSpan(
                            text: product.title,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              // TextSpan(
                              //   text: "\n${product.variant} ",
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.normal,
                              //     fontSize: 15,
                              //   ),
                              // ),
                            ]),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: SizeConfig.screenWidth * 0.6,
                      child: ExpandableText(
                          content: product.description,
                        ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: SizeConfig.screenWidth * 0.3,
                          alignment: Alignment.center,
                          child: ShoppersPopular(),
                        ),
                        BtnDetail(
                          icono: "assets/icons/AB4.svg",
                          text: 'COMPARTIR',
                          press: () {
                            showDialog(context: context, builder: (buildcontext) => ShareScreen());
                          },
                          background: kShopColor,
                        ),
                      ],
                    ),
                    
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: SizeConfig.screenWidth * 0.29,
                      decoration: BoxDecoration(
                        border: Border.all(color: kSecondaryColor),
                        color: kShopColor,
                        borderRadius: BorderRadius.only( topLeft: Radius.circular(4), topRight: Radius.circular(4) )
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                      child: Text(
                        "Entrega 2 dias",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getProportionateScreenWidth(12)
                        ),
                      )
                    ),
                    AddToCartFAB(productId: productId,),
                    FavouriteButtom(product: product),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: getProportionateScreenHeight(65),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30), vertical: getProportionateScreenWidth(10)),
                    decoration: BoxDecoration(
                      border: Border.all(color: kShopColor),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                    ),
                    child: Text.rich(
                      TextSpan(
                        text: "\$${product.originalPrice} \n",
                        style: TextStyle(
                              color: kShopColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                        children: [
                          TextSpan(
                            text: "PRECIO BASICO",
                            style: TextStyle(
                          color: kShopColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                            
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Checkout(product: product,),));
                    },
                      child: Container(
                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30), vertical: getProportionateScreenWidth(10) ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                        color: kShopColor
                      ),
                      child: Text.rich(
                        TextSpan(
                          text: "\$${product.discountPrice} \n",
                          style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                          children: [
                            TextSpan(
                              text: " PRECIO UNIDOS",
                              style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                          ),
                              
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center
                      ),
                    ),
                  ),
                  
                  // Flexible(
                  //   flex: 3,
                  //   child: Stack(
                  //     children: [
                  //       SvgPicture.asset(
                  //         "assets/icons/Discount.svg",
                  //         color: kPrimaryColor,
                  //       ),
                  //       Center(
                  //         child: Text(
                  //           "${product.calculatePercentageDiscount()}%\nOff",
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: getProportionateScreenHeight(15),
                  //             fontWeight: FontWeight.w900,
                  //           ),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15), vertical: getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFCC0202)),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
                'SUMA 2 AMIGOS A ESTA COMPRA Y GANA 5O MASBITS',
                style: TextStyle(
                  fontSize: 11,
                  color: kSecondaryColor,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 10),
            GFAccordion(
              titleBorder: Border.all(color: kSecondaryColor),
              titleBorderRadius: BorderRadius.circular(10),
              titleChild: Text(
                "PAGO COMBINADO",
                style: TextStyle(
                  color: kSecondaryColor,
                  fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
                ),
                contentChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: SizeConfig.screenWidth * 0.58,
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1, color: kSecondaryColor))),
                          child: Text(
                            'MASPAY'
                          ),
                        ),
                        Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1, color: kSecondaryColor))),
                      child: Text(
                        "\$ 1.00.000"
                      ),
                    ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: SizeConfig.screenWidth * 0.58,
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1, color: kSecondaryColor))),
                          child: Text(
                            'MASBIT'
                          ),
                        ),
                        Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1, color: kSecondaryColor))),
                      child: Text(
                        '\$ 800.000'
                      ),
                    ),
                      ],
                    ),
                    FlatButton(
                  color: kPrimaryColor,
                  onPressed: () => {}, 
                  child: Column(
                    children: [
                      Text(
                        "COMPRA YA",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      
                    ],
                  )
                ),
                    
                  ],
                ),
              textStyle:
                      TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
                  collapsedIcon: SvgPicture.asset(
              "assets/icons/ScrollDownArrow_light.svg",
              color: kSecondaryColor,
              width: 18,
            ),
                  expandedIcon: Icon(Icons.minimize),
                  showAccordion: false
            ),
            const SizedBox(height: 10),
            GFAccordion(
              titleBorder: Border.all(color: kShopColor),
              titleBorderRadius: BorderRadius.circular(10),
                    titleChild: Text("UNETE YA, NO ESPERES!",
                    textAlign: TextAlign.center,),
                      contentChild: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1, color: kSecondaryColor))),
                            child: UsersBullet(
                              image: "assets/images/Profile Image.png",
                              name: "jose",
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1, color: kSecondaryColor))),
                            child: UsersBullet(
                              image: "assets/images/Profile Image.png",
                              name: "fabian",
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1, color: kSecondaryColor))),
                            child: UsersBullet(
                              image: "assets/images/Profile Image.png",
                              name: "Andres",
                            ),
                          ),
                          
                        ],
                      ),
                    textStyle:
                            TextStyle(color: kSecondaryColor, fontWeight: FontWeight.w600),
                        collapsedIcon: SvgPicture.asset(
                          'assets/icons/ScrollDownArrow_light.svg',
                          color: kPrimaryColor,
                          width: 12,
                        ),
                        expandedIcon: Icon(Icons.minimize),
                        showAccordion: true,
                  ),
             Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0,
              ),
              child: Container(
                child: Text(
                  "SELECCIONA TUS PREFERENCIAS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
              ),
              child: Container(
                width: SizeConfig.screenWidth * 1,
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(05)),
                  decoration: BoxDecoration(
                    border: Border.all(color: kSecondaryColor),
                    borderRadius: BorderRadius.circular(8)
                  ),
                alignment: Alignment.center, 
                child: CartCounter()
                ),
            ),
            SizedBox(height: getProportionateScreenWidth(15)),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
              ),
              child: Container(
                width: SizeConfig.screenWidth * 1.5,
                padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(05)),
                decoration: BoxDecoration(
                  border: Border.all(color: kSecondaryColor),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text(
                  "COLOR",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(15)),
            ProductColors(product: product,
              onselected: (colors){
                _selectedproductColors = colors;
              },
            ),
            const SizedBox(height: 16),
            DescriptionWidget(),
            const SizedBox(height: 16),
            // ExpandableText(
            //   title: "Caracteristica",
            //   content: product.highlights,
            // ),
            // const SizedBox(height: 16),
            // Text.rich(
            //   TextSpan(
            //     text: "Vendido por ",
            //     style: TextStyle(
            //       fontSize: 15,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     children: [
            //       TextSpan(
            //         text: "${product.seller}",
            //         style: TextStyle(
            //           decoration: TextDecoration.underline,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

          ],
        ),
      ],
    );
  }
}

class BtnDetail extends StatelessWidget {
  final String icono;
  final String text;
  final GestureTapCallback press;
  final bool isColor;
  final Color background;

  const BtnDetail({
  
    Key key, this.icono, this.text, this.press, this.isColor = false, this.background, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
                // onTap: () async {
                //   await _addToCart();
                //   Scaffold.of(context).showSnackBar(_snackBar);
                // },
                child: Container(
                  width: SizeConfig.screenWidth * 0.3,
                  decoration: BoxDecoration(
                      color:   background,
                      border: Border.all(width: 1.5, color: Colors.black)
                      ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(6.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        
                        SvgPicture.asset(
                          icono,
                          width: SizeConfig.screenWidth * 0.04,
                          color: isColor ? kSecondaryColor : Colors.white,                    
                        ),
                       
                        Text(
                          text,
                          style: TextStyle(
                            color: isColor ? kSecondaryColor : Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              );
  }
}
