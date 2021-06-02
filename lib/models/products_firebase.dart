import 'package:cloud_firestore/cloud_firestore.dart';
class ProductsFirebase {
  getData() {
    return Firestore.instance.collection('products').snapshots();
  }
}