import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masdamas/screens/details/components/ProductSize.dart';
import 'package:masdamas/screens/details/components/cart_counter.dart';
import 'package:masdamas/screens/details/components/custom_appbar.dart';
import 'package:masdamas/components/product_images.dart';

import '../../../constants.dart';


class PrecioUnidos extends StatefulWidget {
  static String routeName = "/details";
  final String productId;
  PrecioUnidos({this.productId,});


  @override
  _PrecioUnidosState createState() => _PrecioUnidosState();
}

class _PrecioUnidosState extends State<PrecioUnidos> {
final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("products");

  final CollectionReference _usersRef = FirebaseFirestore.instance.collection(
      "users"); // User -> UserID (Document) -> Cart -> productID(Document)

  User _user = FirebaseAuth.instance.currentUser;

  String _selectedproductSize = "0";


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
          body: Stack(children: [
          Container(
            child: Text(
              'payment'
            ),
          ),
          Container(
              child: CustomActionBar(
            hasBackArrow: true,
            title: "PRECIO UNIDOS",
            hasTitle: true,
            press: () => Navigator.pop(context),
          ))
        ])
    );
  }
}