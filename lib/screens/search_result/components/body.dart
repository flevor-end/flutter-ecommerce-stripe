import 'package:masdamas/components/nothingtoshow_container.dart';
import 'package:masdamas/components/product_card.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/product_details/product_details_screen.dart';
import 'package:masdamas/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final String searchQuery;
  final List<String> searchResultProductsId;
  final String searchIn;

  const Body({
    Key key,
    @required this.searchQuery,
    @required this.searchResultProductsId,
    @required this.searchIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20)),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(10)),
                Text(
                  "Resultado de búsqueda",
                  style: headingStyle,
                ),
                Text.rich(
                  TextSpan(
                    text: "$searchQuery",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                    children: [
                      TextSpan(
                        text: " en ",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      TextSpan(
                        text: "$searchIn",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.75,
                  child: buildProductsGrid(),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProductsGrid() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF5F6F9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Builder(
        builder: (context) {
          if (searchResultProductsId.length > 0) {
            return GridView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: searchResultProductsId.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  productId: searchResultProductsId[index],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(
                          productId: searchResultProductsId[index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
          return Center(
            child: NothingToShowContainer(
              iconPath: "assets/icons/search_no_found.svg",
              secondaryMessage: "Encontrados 0 productos",
              primaryMessage: "Prueba con otra palabra clave de búsqueda",
            ),
          );
        },
      ),
    );
  }
}