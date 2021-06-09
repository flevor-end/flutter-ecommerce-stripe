import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/models/Product.dart';
import 'package:masdamas/services/database/user_database_helper.dart';
import 'package:masdamas/size_config.dart';

class Payment extends StatefulWidget {
  final Product product;
  
  const Payment({
    Key key,
     this.product,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => payment();
}

class Item {
  final String itemName;
  final String itemQun;
  final String itemPrice;

  Item({this.itemName, this.itemQun, this.itemPrice});
}

class payment extends State<Payment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;

  List picked = [false, false];

  int totalAmount = 0;

  pickToggle(index) {
    setState(() {
      picked[index] = !picked[index];
      getTotalAmount();
    });
  }

  getTotalAmount() {
    var count = 0;
    for (int i = 0; i < picked.length; i++) {
      if (picked[i]) {
        count = count + 1;
      }
      if (i == picked.length - 1) {
        setState(() {
          totalAmount = 248 * count;
        });
      }
    }
  }
  

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

  int radioValue = 0;
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  List<Item> itemList = <Item>[
    Item(itemName: 'Black Grape', itemQun: 'Qty:1', itemPrice: '\₹ 100'),
    Item(itemName: 'Tomato', itemQun: 'Qty:3', itemPrice: '\₹ 112'),
    Item(itemName: 'Mango', itemQun: 'Qty:2', itemPrice: '\₹ 105'),
    Item(itemName: 'Capsicum', itemQun: 'Qty:1', itemPrice: '\₹ 90'),
    Item(itemName: 'Lemon', itemQun: 'Qty:2', itemPrice: '\₹ 70'),
    Item(itemName: 'Apple', itemQun: 'Qty:1', itemPrice: '\₹ 50'),
  ];
  String toolbarname = 'Confirmación del pedido';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final double height = MediaQuery.of(context).size.height;

    AppBar appBar = AppBar(
      leading: IconButton(
        icon: Icon(_backIcon()),
        alignment: Alignment.centerLeft,
        tooltip: 'Back',
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
                            //                     color: Colors.black38),
                            //               ),
                            //               IconButton(
                            //                   icon: Icon(
                            //                     Icons.play_circle_outline,
                            //                     color: Colors.black38,
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
                            //                     color: Colors.black),
                            //               ),
                            //               IconButton(
                            //                   icon: Icon(
                            //                     Icons.check_circle,
                            //                     color: kSecondaryColor,
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
                                    fontSize: 11,
                                  ),
                                ),
                              ]),
                        ),
                        _verticalDivider(),
                        Container(
                          child: Row( children:
                            [
                              SvgPicture.asset(
                                "assets/icons/gps.svg"
                              ),
                              Text('cra 10 # 45 -56 ')
                            ]
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            Container(
                margin: EdgeInsets.all(10.0),
                child: Card(
                  child: Container(
                    color: Colors.green.shade100,
                    child: Container(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                        child: Text(
                            "Suma 2 Amigos a esta compra y Gana 50 MASBIT ",
                            maxLines: 10,
                            style: TextStyle(
                                fontSize: 13.0, color: Colors.black87))),
                  ),
                )),
            Container(
              alignment: Alignment.topLeft,
              margin:
                  EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
              child: Text(
                'Método de pago',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
            _verticalDivider(),
            SafeArea(
              
              child: Container(
                padding: EdgeInsets.only(left: 10),
                height: SizeConfig.screenHeight * 0.45,
                            
                              child: Wrap(
                                spacing: 5,
                                runSpacing: 10,

                          children: <Widget>[
                            
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: kSecondaryColor),
                                borderRadius: BorderRadius.circular(8)),
                              width: SizeConfig.screenHeight * 0.26,
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/masbit.png",
                                    width: SizeConfig.screenWidth * 0.13,
                                  ),
                                  // Text("MASPAY",
                                  //     maxLines: 10,
                                  //     style: TextStyle(
                                  //         fontSize: 15.0, color: Colors.black)),
                                  Radio<int>(
                                      value: 0, groupValue: 0, onChanged: null),
                                ],
                              ),
                            ),
                            
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: kSecondaryColor),
                                borderRadius: BorderRadius.circular(8)),
                              width: SizeConfig.screenHeight * 0.26,
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                  Image.asset(
                                    "assets/images/masbit.png",
                                    width: SizeConfig.screenWidth * 0.13,
                                  ),
                                  Text(
                                    '+',
                                    style: TextStyle(
                                      color: kSecondaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/maspay.png",
                                    width: SizeConfig.screenWidth * 0.13,
                                  ),
                                      ]

                                    ),
                                    Radio<int>(
                                        value: 0,
                                        groupValue: radioValue,
                                        onChanged: null),
                                  ],
                                )),
                           
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: kSecondaryColor),
                                borderRadius: BorderRadius.circular(8)),
                              width: SizeConfig.screenHeight * 0.26,
                                padding: EdgeInsets.symmetric(vertical: 18.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/images/pse.png",
                                      width: SizeConfig.screenWidth * 0.32,
                                    ),
                                    Radio<int>(
                                        value: 0, groupValue: 0, onChanged: null),
                                  ],
                                )),
                            
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: kSecondaryColor),
                                borderRadius: BorderRadius.circular(8)),
                              width: SizeConfig.screenHeight * 0.26,
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/images/payu.png",
                                      width: SizeConfig.screenWidth * 0.32,
                                    ),
                                    Radio<int>(
                                        value: 0, groupValue: 0, onChanged: null),
                                  ],
                                )),
                            
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: kSecondaryColor),
                                borderRadius: BorderRadius.circular(8)),
                              width: SizeConfig.screenHeight * 0.26,
                                padding: EdgeInsets.symmetric(vertical: 17.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/images/tarjetas.png",
                                      width: SizeConfig.screenWidth * 0.32,
                                    ),
                                    Radio<int>(
                                        value: 0,
                                        groupValue: 0,
                                        onChanged: handleRadioValueChanged),
                                  ],
                                )),
                            
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: kSecondaryColor),
                                borderRadius: BorderRadius.circular(8)),
                              width: SizeConfig.screenHeight * 0.26,
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Column(
                                      children: [

                                        IconButton(
                                        icon: Icon(Icons.add_circle_outline, color: kSecondaryColor,), onPressed: null),
                                        Text(
                                          "Añadir Metodo de Pago",
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: kPrimaryColor,
                                              fontSize:  getProportionateScreenWidth(12),
                                              fontWeight: FontWeight.bold
                                          )
                                        ),
                                      ],
                                    ),
                                    // Radio<int>(
                                    //     value: 0, groupValue: 0, onChanged: null),
                                  ],
                                )),
                            Divider(),
                          ],
                        ),
                ),
              ),  
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
                          child: RaisedButton(
                              onPressed: () {},
                              elevation: 0.5,
                              color: kSecondaryColor,
                              child: Center(
                                child: Text(
                                  'CONTINUAR',
                                ),
                              ),
                              textColor: Colors.white,
                            ),
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
    Widget itemCard(itemName, color, price, imgPath, available, i) {
    return InkWell(
      onTap: () {
        if (available) {
          pickToggle(i);
        }
      },
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 3.0,
              child: Container(
                  padding: EdgeInsets.only(left: 15.0, right: 10.0),
                  width: MediaQuery.of(context).size.width - 20.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(
                                color: available
                                    ? Colors.grey.withOpacity(0.4)
                                    : Colors.red.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(12.5),
                              ),
                              child: Center(
                                  child: available
                                      ? Container(
                                          height: 12.0,
                                          width: 12.0,
                                          decoration: BoxDecoration(
                                              color: picked[i]
                                                  ? Colors.yellow
                                                  : Colors.grey
                                                      .withOpacity(0.4),
                                              borderRadius:
                                                  BorderRadius.circular(6.0)),
                                        )
                                      : Container()))
                        ],
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        height: 150.0,
                        width: 125.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(imgPath),
                                fit: BoxFit.contain)),
                      ),
                      SizedBox(width: 4.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                itemName,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              SizedBox(width: 7.0),
                              available
                                  ? picked[i]
                                      ? Text(
                                          'x1',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                              color: Colors.grey),
                                        )
                                      : Container()
                                  : Container()
                            ],
                          ),
                          SizedBox(height: 7.0),
                          available
                              ? Text(
                                  'Color: ' + color,
                                  style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Colors.grey),
                                )
                              : OutlineButton(
                                  onPressed: () {},
                                  borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 1.0,
                                      style: BorderStyle.solid),
                                  child: Center(
                                    child: Text('Find Similar',
                                        style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.0,
                                            color: Colors.red)),
                                  ),
                                ),
                          SizedBox(height: 7.0),
                          available
                              ? Text(
                                  '\$' + price,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Color(0xFFFDD34A)),
                                )
                              : Container(),
                        ],
                      )
                    ],
                  )))),
    );
  }

  _verticalDivider() => Container(
        padding: EdgeInsets.all(2.0),
      );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 5.0),
      );
}