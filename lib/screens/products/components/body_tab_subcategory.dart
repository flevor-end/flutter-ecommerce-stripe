import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:masdamas/components/product_card.dart';
import 'package:masdamas/screens/details/details_screen.dart';
import 'package:path/path.dart';

import '../../../constants.dart';
import 'product_item_card.dart';

class BodyTabSubCategory extends StatelessWidget {

  final CollectionReference _productsRef =
  FirebaseFirestore.instance.collection("products");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(children: [
        FutureBuilder<QuerySnapshot>(
          future: _productsRef.get(),
          builder: (context, snapshot){
            if(snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text(
                    "Error: ${snapshot.error}"
                  ),
                ),
              );
            }
            //collection Data ready to display
            if(snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: snapshot.data.docs.map((document) {
                  return 
                  ProductItemCard(
                    title: document.data()['name'],
                    imageUrl: document.data()['images'][0],
                    price: "\$${document.data()['price']}",
                    productId: document.id,
                  );
                }).toList(),
              );
            }
            //Loading State
            return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
          }
          )
      ],),
    );
  }
}

