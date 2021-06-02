import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:masdamas/models/Product.dart';

class ExpansionDetails extends StatelessWidget {
  final Product product;

  const ExpansionDetails({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GFAccordion(
          title: "Descripción",
          content: product.description,
        )
      ],
    );
  }
}
