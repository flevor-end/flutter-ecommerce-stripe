
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:masdamas/components/product_short_detail_card.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/models/CartItem.dart';
import 'package:masdamas/models/Product.dart';
import 'package:masdamas/screens/payments/payment_Screen.dart';
import 'package:masdamas/screens/product_details/product_details_screen.dart';
import 'package:masdamas/services/database/product_database_helper.dart';
import 'package:masdamas/services/database/user_database_helper.dart';

import '../../size_config.dart';

class Checkout extends StatefulWidget {
  final Product product;
  const Checkout({
    Key key,
     this.product,
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() => check_out();
}


  

class Item {
  final String itemName;
  final String itemQun;
  final String itemPrice;

  Item({this.itemName, this.itemQun, this.itemPrice});
}

class check_out extends State<Checkout> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;
  
  String get cartItemId => null;

  IconData _backIcon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }

  List<Item> itemList = <Item>[
    Item(itemName: 'Black Grape', itemQun: 'Qty:1', itemPrice: '\₹ 100'),
    Item(itemName: 'Tomato', itemQun: 'Qty:3', itemPrice: '\₹ 112'),
    Item(itemName: 'Mango', itemQun: 'Qty:2', itemPrice: '\₹ 105'),
    Item(itemName: 'Capsicum', itemQun: 'Qty:1', itemPrice: '\₹ 90'),
    Item(itemName: 'Lemon', itemQun: 'Qty:2', itemPrice: '\₹ 70'),
    Item(itemName: 'Apple', itemQun: 'Qty:1', itemPrice: '\₹ 50'),
  ];
  String toolbarname = 'Confirmación del Pedido';

  @override
  Widget build(BuildContext context,) {
    
    
    final double height = MediaQuery.of(context).size.height;

    AppBar appBar = AppBar(
      leading: IconButton(
        icon: Icon(_backIcon()),
        alignment: Alignment.centerLeft,
        tooltip: 'Atras',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(toolbarname),
      backgroundColor: Colors.white,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 150.0,
            width: 30.0,
            child: GestureDetector(
              onTap: () {
                /*Navigator.of(context).push(
                   MaterialPageRoute(
                      builder:(BuildContext context) =>
                       CartItemsScreen()
                  )
              );*/
              },
            ),
          ),
        )
      ],
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar,
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(5.0),
                child: Card(
                    child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // three line description
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: <Widget>[
                            //     Padding(
                            //       padding: const EdgeInsets.only(bottom: 8.0),
                            //       child: Container(
                            //           alignment: Alignment.center,
                            //           child: Row(
                            //             children: <Widget>[
                            //               Text(
                            //                 'Entrega',
                            //                 style: TextStyle(
                            //                     fontSize: 18.0,
                            //                     fontWeight: FontWeight.bold,
                            //                     color: Colors.black),
                            //               ),
                            //               IconButton(
                            //                   icon: Icon(
                            //                     Icons.play_circle_outline,
                            //                     color: kSecondaryColor,
                            //                   ),
                            //                   onPressed: null)
                            //             ],
                            //           )),
                            //     ),
                            //     Padding(
                            //       padding: const EdgeInsets.only(bottom: 8.0),
                            //       child: Container(
                            //           alignment: Alignment.center,
                            //           child: Row(
                            //             children: <Widget>[
                            //               Text(
                            //                 'Pago',
                            //                 style: TextStyle(
                            //                     fontSize: 18.0,
                            //                     fontWeight: FontWeight.bold,
                            //                     color: Colors.black38),
                            //               ),
                            //               IconButton(
                            //                   icon: Icon(
                            //                     Icons.check_circle,
                            //                     color: Colors.black38,
                            //                   ),
                            //                   onPressed: null)
                            //             ],
                            //           )),
                            //     ),
                            //   ],
                            // ),
                          ],
                        )))),
            _verticalDivider(),
            Container(
              alignment: Alignment.topLeft,
              margin:
                  EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
              child: Text(
                'Resumen de la orden',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
            Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: kSecondaryColor),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: SizedBox(
                        width: getProportionateScreenWidth(88),
                        child: AspectRatio(
                          aspectRatio: 0.88,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: widget.product.images.length > 0
                                ? Image.network(
                                    widget.product.images[0],
                                    fit: BoxFit.contain,
                                  )
                                : Text("Sin imágen"),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.title,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: kTextColor,
                          ),
                          maxLines: 2,
                        ),
                        SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                              text: "\$${widget.product.discountPrice}    ",
                              style: TextStyle(
                                color: kShopColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                              children: [
                                TextSpan(
                                  text: "\n ENTREGA 02 DIAS",
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _verticalDivider(),
              Container(
                width: SizeConfig.screenWidth * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(color: kSecondaryColor)
                ),
                margin: EdgeInsets.only(
                    
                    top: 5.0,
                    right: 0.0,
                    bottom: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: SizeConfig.screenWidth * 8.9,
                      padding: EdgeInsets.symmetric(vertical: 5,),
                      decoration: BoxDecoration(
                        color: kSecondaryColor
                      ),
                      child: Text(
                        'DETALLES',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:[
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border(right: BorderSide(color: kSecondaryColor))
                        ),
                        child: Column(
                        children: [
                          Text(
                            'Cantidad',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 13.0,
                                letterSpacing: 0.5),
                          ),
                          _verticalDivider(),
                          Text(
                            '01',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 13.0,
                                letterSpacing: 0.5),
                          ),
                        ],
                    ),
                      ),
                    _verticalDivider(),
                    Container(
                      padding: EdgeInsets.only(right: 30),
                      decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: kSecondaryColor))
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Color',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 13.0,
                                letterSpacing: 0.5),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 2, bottom: 5, top: 5),
                            padding: EdgeInsets.all(4),
                            height: getProportionateScreenWidth(20),
                            width: getProportionateScreenWidth(20),
                            decoration: BoxDecoration(
                              //color: product.colors[0],
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.black),
                            ),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 00.0,
                          top: 05.0,
                          right: 0.0,
                          bottom: 5.0),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.center,
                        mainAxisAlignment:
                            MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'caracteristica',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black26,
                            ),
                          ),
                          _verticalD(),
                          Text(
                            '543 Gb',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black26,
                            ),
                          ),
                        ],
                      ),
                    )
                      ]
                    )
                  ],
                ),
              ),
         _verticalDivider(),
            Container(
              alignment: Alignment.topLeft,
              margin:
                  EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
              child: Text(
                'Dirección de entrega',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
            Container(
                height: 165.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      height: 165.0,
                      width: 56.0,
                      child: Card(
                        elevation: 3.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                    icon: Icon(Icons.add), onPressed: null)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 165.0,
                      width: 200.0,
                      margin: EdgeInsets.all(7.0),
                      child: Card(
                        elevation: 3.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 12.0,
                                      top: 5.0,
                                      right: 0.0,
                                      bottom: 2.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Fabian Pedraza',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      _verticalDivider(),
                                      Text(
                                        'cll62 #23-32 Bogota ',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13.0,
                                            letterSpacing: 0.5),
                                      ),
                                      _verticalDivider(),
                                      Text(
                                        'Perdomo',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13.0,
                                            letterSpacing: 0.5),
                                      ),
                                      _verticalDivider(),
                                      Text(
                                        'MD 21801',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13.0,
                                            letterSpacing: 0.5),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 00.0,
                                            top: 05.0,
                                            right: 0.0,
                                            bottom: 5.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Entrega',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black26,
                                              ),
                                            ),
                                            _verticalD(),
                                            Checkbox(
                                              value: checkboxValueA,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  checkboxValueA = value;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 130.0,
                      width: 200.0,
                      margin: EdgeInsets.all(7.0),
                      child: Card(
                        elevation: 3.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 12.0,
                                      top: 5.0,
                                      right: 0.0,
                                      bottom: 2.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Lisa J. Cunningham',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      _verticalDivider(),
                                      Text(
                                        '49 Bagwell Avenue',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13.0,
                                            letterSpacing: 0.5),
                                      ),
                                      _verticalDivider(),
                                      Text(
                                        'Ocala',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13.0,
                                            letterSpacing: 0.5),
                                      ),
                                      _verticalDivider(),
                                      Text(
                                        ' FL 34471',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13.0,
                                            letterSpacing: 0.5),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 00.0,
                                            top: 05.0,
                                            right: 0.0,
                                            bottom: 5.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Entrega',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black12,
                                              ),
                                            ),
                                            _verticalD(),
                                            Checkbox(
                                              value: checkboxValueB,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  checkboxValueB = value;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 130.0,
                      width: 200.0,
                      margin: EdgeInsets.all(7.0),
                      child: Card(
                        elevation: 3.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 12.0,
                                      top: 5.0,
                                      right: 0.0,
                                      bottom: 2.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Elizabeth J. Schmidt',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      _verticalDivider(),
                                      Text(
                                        '3674 Oakway Lane',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13.0,
                                            letterSpacing: 0.5),
                                      ),
                                      _verticalDivider(),
                                      Text(
                                        'Long Beach',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13.0,
                                            letterSpacing: 0.5),
                                      ),
                                      _verticalDivider(),
                                      Text(
                                        ' CA 90802',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13.0,
                                            letterSpacing: 0.5),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 00.0,
                                            top: 05.0,
                                            right: 0.0,
                                            bottom: 5.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Entrega',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black12,
                                              ),
                                            ),
                                            _verticalD(),
                                            Checkbox(
                                              value: checkboxValueC,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  checkboxValueC = value;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            _verticalDivider(),
            
            Container(
                alignment: Alignment.bottomLeft,
                height: 50.0,
                child: Card(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.info), onPressed: null),
                      FutureBuilder<num>(
                    future: UserDatabaseHelper().compartidoTotal,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final compartidoTotal = snapshot.data;
                        return Text.rich(
                          TextSpan(text: "Total  ", children: [
                            TextSpan(
                              text: "\$${widget.product.discountPrice}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ]),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: OutlineButton(
                          borderSide:
                              BorderSide(color: kSecondaryColor),
                          child: const Text('CONTINUAR'),
                          textColor: kSecondaryColor,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Payment(product: widget.product)));
                          },
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  IconData _add_icon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.add;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }

  IconData _sub_icon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.remove;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }

  _verticalDivider() => Container(
        padding: EdgeInsets.all(2.0),
      );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 0.0, bottom: 0.0),
      );
}