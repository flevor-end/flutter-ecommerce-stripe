import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/accordian/gf_accordian.dart';
import 'package:masdamas/models/Product.dart';
import 'package:masdamas/screens/details/components/ProductSize.dart';
import 'package:masdamas/screens/details/components/custom_appbar.dart';
import 'package:masdamas/components/product_images.dart';
import 'package:masdamas/screens/shop/components/precio_unidos.dart';
import 'package:path/path.dart';
import '../../constants.dart';
import 'components/cart_counter.dart';
import 'components/description_widget.dart';

class DetailsScreen extends StatefulWidget {
  static String routeName = "/details";
  final String productId;
  DetailsScreen({this.productId});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("products");

  final CollectionReference _usersRef = FirebaseFirestore.instance.collection(
      "users"); // User -> UserID (Document) -> Cart -> productID(Document)

  User _user = FirebaseAuth.instance.currentUser;

  String _selectedproductSize = "0";

  Future _addToCart() {
    return _usersRef
        .doc(_user.uid)
        .collection("Cart")
        .doc(widget.productId)
        .set({"size": _selectedproductSize});
  }

  Future _addToSaved() {
    return _usersRef
        .doc(_user.uid)
        .collection("Saved")
        .doc(widget.productId)
        .set({"size": _selectedproductSize});
  }

  final SnackBar _snackBar = SnackBar(
    content: Text("product added to the cart"),
  );

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        body:
            // Container(
            //    child: Center(
            //      child:Text("ID: ${widget.productId}")
            //    ),
            //  )
            Stack(children: [
          FutureBuilder(
            future: _productsRef.doc(widget.productId).get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                //Firebase Document Data Map
                Map<String, dynamic> documentData = snapshot.data.data();

                //List of images
                List imageList = documentData['images'];
                List productSizes = documentData['size'];

                //set an initial size
                _selectedproductSize = productSizes[0];

                return ListView(padding: EdgeInsets.symmetric(horizontal: 10), children: [
                  //ProductImages(product: product,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 79.7,
                              width: size.width * 0.645,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${documentData['name']}" ?? "Product Name",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "${documentData['description']}" ?? "Description",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            Row(
                              children: [
                                GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: size.width * 0.32,
                              decoration: BoxDecoration(
                                  color: Color(0xFFDCDCDC),
                                  border: Border.all(width: 1.5, color: Colors.black)
                                  ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(6.5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 22,
                                      width: 22,
                                      child: FlatButton(
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30)),
                                        color: kSecondaryColor,
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  
                                  ],
                                ),
                              )
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: size.width * 0.325,
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/AB4.svg",
                                      width: 20,
                                    ),
                                   
                                    Text(
                                      'COMPARTIR',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ),
                          ),
                              ],
                              )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: size.width * 0.3,
                            color: Colors.black87,
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                            child: Text(
                              "Entrega 2 dias",
                              style: TextStyle(
                                color: Colors.white
                              ),
                              )),
                          GestureDetector(
                            onTap: () async {
                              await _addToCart();
                              Scaffold.of(context).showSnackBar(_snackBar);
                            },
                            child: Container(
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                  color: Color(0xFFDCDCDC),
                                  border: Border.all(width: 1.5, color: Colors.black)
                                  ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(6.5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/Grupo 3603.svg",
                                    ),
                                   
                                    Text(
                                      'CARRITO',
                                      style: TextStyle(
                                        
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ),
                          ),
                          GestureDetector(
                            onTap: () async { 
                              await _addToSaved();
                                Scaffold.of(context).showSnackBar(_snackBar);
                            },
                            child: Container(
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              border: Border.all(width: 1.5, color: Colors.black)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                SvgPicture.asset(
                                  "assets/icons/Grupo 5437.svg",
                                  color: Colors.white,
                                ),
                                Text(
                                  "ME GUSTA",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ]   
                              ),
                            ),
                          ),
                        ),     
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                          width: size.width * 0.472,
                          decoration: BoxDecoration(
                            color: Color(0xFFDCDCDC),
                            
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              Text(
                                "\$${documentData['price']}"
                              ),
                              Text(
                                "PRECIO BASICO",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ]   
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrecioUnidos(),
                  ));
                          },
                          child: Container(
                          width: size.width * 0.472,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              Text(
                                "\$${documentData['priceShared']}",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "PRECIO UNIDOS",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ]   
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                            child: Container(),
                          ),
                          Container(
                            child: Container(),
                          ),
                          Container(
                            child: Container()
                          ),
                          
                        ],
                      ),
                    textStyle:
                            TextStyle(color: kSecondaryColor, fontWeight: FontWeight.w600),
                        collapsedIcon: Icon(Icons.arrow_circle_down_outlined),
                        expandedIcon: Icon(Icons.minimize),
                        showAccordion: true,
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 10.0,
                    ),
                    child: Container(
                      child: Text(
                        "SELECCIONA TUS PREFERENCIAS",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(alignment: Alignment.center, child: CartCounter()),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 10.0,
                    ),
                    child: Container(
                      child: Text(
                        "PREFERENCIA 1 TAMAÑO",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ProductSize(
                    productSizes: productSizes,
                    onselected: (size) {
                      _selectedproductSize = size;
                    },
                  ),
                  DescriptionWidget(),
                ]);
              }

              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          Container(
              child: CustomActionBar(
            hasBackArrow: true,
            title: "SHOPPING \nSubCategoria",
            hasTitle: true,
            press: () => Navigator.pop(context),
          ))
        ])
        // bottomNavigationBar: TopRoundedContainer(
        //                     color: Colors.white,
        //                     child: Padding(
        //                       padding: EdgeInsets.only(
        //                         left: 15,
        //                         right: 15,
        //                         top: 15,
        //                         bottom: 15,
        //                       ),
        //                       child: DefaultButton(
        //                         text: "Comprar",
        //                         press: () {},
        //                       ),
        //                     ))
        );
  }
}

//Necesitamos pasar nuestros productos al detalle
// y debemos usar el nombre de la ruta para poder crear el argumento

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
}
