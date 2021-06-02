// import 'package:flutter/material.dart';
// import 'package:masdamas/models/product.dart';
// import 'package:masdamas/services/product.dart';

// class ProductProvider with ChangeNotifier {
//   ProductServices _productServices = ProductServices();
//   List<ProductModel> products = [];
//   List<ProductModel> productsSearched = [];

//   ProductProvider.initialize() {
//     loadProducts();
//   }

//   loadProducts() async {
//     products = await _productServices.getProducts();
//     notifyListeners();
//   }

//   Future search({String productName}) async {
//     productsSearched =
//         await _productServices.searchProducts(productName: productName);
//     notifyListeners();
//   }
// }
