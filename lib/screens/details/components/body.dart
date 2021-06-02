import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/accordian/gf_accordian.dart';
import 'package:masdamas/models/Product.dart';
import 'package:masdamas/models/products_firebase.dart';
import 'package:masdamas/screens/details/components/description_widget.dart';
import 'package:masdamas/screens/details/components/pay_bit.dart';
import 'package:masdamas/screens/details/components/products_colors.dart';
import '../../../constants.dart';
import 'User_bullet.dart';
import 'cart_counter.dart';
import 'details_tabs.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';



class Body extends StatefulWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin{
  TabController tabController;

  var productDetails;

  @override
  void initState() {
    super.initState();

    setState(() {
      productDetails = ProductsFirebase().getData();
    });
  }

  // getProductsEntries() {
  //   if (productDetails != null) {
  //       return StreamBuilder(
  //         stream: productDetails,
  //         builder: (context, snapshot) {
  //           if(snapshot.data != null) {
  //             return ListView.builder(
  //               primary: false,
  //               shrinkWrap: true,
  //               itemCount: snapshot.data.documents.length,
  //               itemBuilder: (context, i) {
  //                 return new Column(
  //                   children: <Widget>[
  //                     ProductImages(snapshot.data.documents[i].data['images']),
  //                     ProductDescription(
  //                       snapshot.data.documents[i].data['title'],
  //                       snapshot.data.documents[i].data['description']
  //                     ),
  //                     ButtomBuy(
  //                       snapshot.data.documents[i].data['price'],
  //                       snapshot.data.documents[i].data['priceShared']
  //                       )
  //                   ],
  //                 );
  //               }
  //               );
  //           }
  //         }
  //         );
  //   } else {
  //     return new Text('Loadong... Please Wait');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            
            TopRoundedContainer(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    //margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ProductDescription(
                      product: widget.product,
                      pressOnSeeMore: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                              border: Border.all(width: 1.5, color: kSecondaryColor)),
                    child: DetailsTabs(size: size, product: widget.product),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        //border: Border.all(width: 1, color: kSecondaryColor)
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PayBit(),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: kSecondaryColor
                    ),
                    child: Text(
                      "SUMA 2 AMIGOS A ESTA COMPRA Y GANA 50 MASBITS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12
                      ),
                    ),
                  ),
                  GFAccordion(
                    titleChild: Text("UNETE YA, NO ESPERES!",textAlign: TextAlign.center,),
                      contentChild: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1, color: kSecondaryColor))),
                            child: UsersBullet(
                              // image: products[0].users[0].image,
                              // name: products[0].users[0].name,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1, color: kSecondaryColor))),
                            child: UsersBullet(
                              // image: products[0].users[1].image,
                              // name: products[0].users[1].name,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1, color: kSecondaryColor))),
                            child: UsersBullet(
                              // image: products[0].users[2].image,
                              // name: products[0].users[2].name,
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
                  TopRoundedContainer(
                     color: Color(0xFFF6F7F9),
                      child: Column(
                       children: [
                         Text("SELECCIONA TUS PREFERENCIAS"),
                         SizedBox(
                           height: 20,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text("CANTIDAD"),
                             SizedBox(width: 20),
                             CartCounter(),
                           ],
                         ),
                       ],
                     ),
                  ),
                  TopRoundedContainer(
                    color: Color(0xFFF6F7F9),
                    child: Column(
                      children: [
                        Text('2 Colores'),
                        TopRoundedContainer(
                          color: Colors.white,
                          
                          child: ProductsColors(product: widget.product))
                      ],
                    ),
                  ),
                  TopRoundedContainer(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text('Talla'),
                        SizedBox(
                           height: 20,
                         ),
                         //Categorytabs(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           
                            _Sizeditem(text: "7",),
                            _Sizeditem(text: "8",),
                            _Sizeditem(text: "9",),
                            _Sizeditem(text: "9.5",),
                            _Sizeditem(text: "10",),
                            _Sizeditem(text: "10.5",),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TopRoundedContainer(
                    color: Color(0xFFF6F7F9),
                    child: Column(
                      children: [
                        // Categorytabs(),
                        //ColorDots(product: product),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _Sizeditem extends StatelessWidget {

  final String text;

  const _Sizeditem({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.all(5),
      child: Text('US $text', style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 11,
      ),),

      );
  }
}

