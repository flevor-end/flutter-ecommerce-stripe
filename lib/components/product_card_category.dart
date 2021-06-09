import 'package:masdamas/components/shoppers_popular.dart';
import 'package:masdamas/services/database/product_database_helper.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../constants.dart';
import 'package:masdamas/models/Product.dart';

import '../size_config.dart';

class ProductCardCategory extends StatelessWidget {
  final String productId;
  final GestureTapCallback press;
  const ProductCardCategory({
    Key key,
    @required this.productId,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.5, color: kShopColor),
          borderRadius: BorderRadius.all(
            Radius.circular(08),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: FutureBuilder<Product>(
            future: ProductDatabaseHelper().getProductWithID(productId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final Product product = snapshot.data;
                return buildProductCardItems(product);
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError) {
                final error = snapshot.error.toString();
                Logger().e(error);
              }
              return Center(
                child: Icon(
                  Icons.error,
                  color: kTextColor,
                  size: 60,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

Row buildProductCardItems(Product product) {
  return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomLeft: Radius.circular(8)),
                border: Border.all(width: 1, color: kSecondaryColor)
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: product.images.length > 0
                    ? Image.network(
                        product.images[0],
                        fit: BoxFit.contain,
                      )
                    : Text("Sin imágen"),
              ),
            ),
          ),
        ),
        
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenWidth(5)),
              Container(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(14)),
                child: Text(
                  product.title,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(20),
                    fontWeight: FontWeight.bold,
                    color: kSecondaryColor,
                  ),
                  maxLines: 2,
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(6)),
              ContentCardProduct(
                hasText: false,
                hasUsericon: true,
                text: 'Usuarios',
                description: 'ENTREGA 15 DIAS', 
                isColor: true,
                
              ),
              ContentCardProduct(
                text: 'PRECIO UNIDOS',
                description: "\$${product.discountPrice}",
                isColor: false,
              ),
              ContentCardProduct(
                text: 'GANA',
                description: "50 MASBIT",
                color: kShopColor,
                isColor: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class ContentCardProduct extends StatelessWidget {
  final String text, description;
  final bool hasText;
  final bool hasUsericon;
  final Color color;
  final Color colorText;
  final bool isColor;
  final GestureTapCallback press;

  const ContentCardProduct({
    Key key, this.text, this.description, this.color, this.colorText = kShopColor, this.isColor = false, this.hasUsericon, this.hasText, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _hasUsericon = hasUsericon ?? false;
    bool _hasText = hasText ?? true;
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1, color: kSecondaryColor), bottom: BorderSide(width: 1, color: kSecondaryColor))
      ),
      child: Row(
        children: [
          Container(
            width: SizeConfig.screenWidth * 0.31,
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(3.6),
              child: Column(
                children: [
                  if(_hasUsericon)
                  Container(
                    alignment: Alignment.center,
                    child: ShoppersPopular(),
                  ),
                  if(_hasText)
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:  isColor ? Colors.white : colorText,
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenHeight(14)
                    ),
                    
                  ),
                ],
              ),
            )
          ),
          Container(
            width: SizeConfig.screenWidth * 0.324,
            decoration: BoxDecoration(
              color: isColor ? kSecondaryColor : kShopColor,
              border: Border(left: BorderSide(width: 1, color: kSecondaryColor),
              )),
            child: Padding(
              padding: const EdgeInsets.all(3.6),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenHeight(14)
                ),
                
              ),
            )
          )
        ],
      ),
    );
  }
}