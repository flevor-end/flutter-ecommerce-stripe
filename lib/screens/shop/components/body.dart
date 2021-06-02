import 'package:masdamas/components/discount_banner.dart';
import 'package:masdamas/components/icons_tabs.dart';
import 'package:masdamas/components/title_categories.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/models/Product.dart';
import 'package:masdamas/screens/category_products/category_products_screen.dart';
import 'package:masdamas/screens/product_details/product_details_screen.dart';
import 'package:masdamas/screens/shop/components/special_offert.dart';
import 'package:masdamas/services/data_streams/all_products_stream.dart';
import 'package:masdamas/services/data_streams/favourite_products_stream.dart';
import 'package:masdamas/size_config.dart';
import 'package:flutter/material.dart';
import '../../product_details/components/product_type_box.dart';
import 'products_section.dart';

const String ICON_KEY = "icon";
const String TITLE_KEY = "title";
const String PRODUCT_TYPE_KEY = "product_type";

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final productCategories = <Map>[
    <String, dynamic>{
      ICON_KEY: "assets/icons/categoria7.svg",
      TITLE_KEY: "Tecnología",
      PRODUCT_TYPE_KEY: ProductType.Tecnologia,
    },
    <String, dynamic>{
      ICON_KEY: "assets/icons/categoria8.svg",
      TITLE_KEY: "Hogar",
      PRODUCT_TYPE_KEY: ProductType.Hogar,
    },
    <String, dynamic>{
      ICON_KEY: "assets/icons/categoria12.svg",
      TITLE_KEY: "Cocina",
      PRODUCT_TYPE_KEY: ProductType.Cocina,
    },
    <String, dynamic>{
      ICON_KEY: "assets/icons/categoria9.svg",
      TITLE_KEY: "Moda",
      PRODUCT_TYPE_KEY: ProductType.Moda,
    },
    <String, dynamic>{
      ICON_KEY: "assets/icons/categoria10.svg",
      TITLE_KEY: "Deportes",
      PRODUCT_TYPE_KEY: ProductType.Deportes,
    },
    <String, dynamic>{
      ICON_KEY: "assets/icons/categoria1.svg",
      TITLE_KEY: "ESports",
      PRODUCT_TYPE_KEY: ProductType.Esports,
    },
    <String, dynamic>{
      ICON_KEY: "assets/icons/categoria2.svg",
      TITLE_KEY: "Infantil",
      PRODUCT_TYPE_KEY: ProductType.Infantil,
    },
    <String, dynamic>{
      ICON_KEY: "assets/icons/categoria3.svg",
      TITLE_KEY: "Joteria",
      PRODUCT_TYPE_KEY: ProductType.Joyeria,
    },
    <String, dynamic>{
      ICON_KEY: "assets/icons/categoria4.svg",
      TITLE_KEY: "Mascotas",
      PRODUCT_TYPE_KEY: ProductType.Mascotas,
    },
    <String, dynamic>{
      ICON_KEY: "assets/icons/categoria11.svg",
      TITLE_KEY: "Bienestar",
      PRODUCT_TYPE_KEY: ProductType.Bienestar,
    },
    <String, dynamic>{
      ICON_KEY: "assets/icons/categoria6.svg",
      TITLE_KEY: "Viajes",
      PRODUCT_TYPE_KEY: ProductType.Viajes,
    },
    <String, dynamic>{
      ICON_KEY: "assets/icons/categoria5.svg",
      TITLE_KEY: "Hotel",
      PRODUCT_TYPE_KEY: ProductType.Hotel,
    },
  ];

  final FavouriteProductsStream favouriteProductsStream =
      FavouriteProductsStream();
  final AllProductsStream allProductsStream = AllProductsStream();

  @override
  void initState() {
    super.initState();
    favouriteProductsStream.init();
    allProductsStream.init();
  }

  @override
  void dispose() {
    favouriteProductsStream.dispose();
    allProductsStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: refreshPage,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(1)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: getProportionateScreenHeight(5)),
                // HomeHeader(
                //   onSearchSubmitted: (value) async {
                //     final query = value.toString();
                //     if (query.length <= 0) return;
                //     List<String> searchedProductsId;
                //     try {
                //       searchedProductsId = await ProductDatabaseHelper()
                //           .searchInProducts(query.toLowerCase());
                //       if (searchedProductsId != null) {
                //         await Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => SearchResultScreen(
                //               searchQuery: query,
                //               searchResultProductsId: searchedProductsId,
                //               searchIn: "Todos los productos",
                //             ),
                //           ),
                //         );
                //         await refreshPage();
                //       } else {
                //         throw "No se pudo realizar la búsqueda debido a alguna razón desconocida";
                //       }
                //     } catch (e) {
                //       final error = e.toString();
                //       Logger().e(error);
                //       Scaffold.of(context).showSnackBar(
                //         SnackBar(
                //           content: Text("$error"),
                //         ),
                //       );
                //     }
                //   },
                //   onCartButtonPressed: () async {
                //     bool allowed =
                //         AuthentificationService().currentUserVerified;
                //     if (!allowed) {
                //       final reverify = await showConfirmationDialog(context,
                //           "No ha verificado su dirección de correo electrónico. Esta acción solo está permitida para usuarios verificados.",
                //           positiveResponse: "Reenviar correo de verificación",
                //           negativeResponse: "Regresa");
                //       if (reverify) {
                //         final future = AuthentificationService()
                //             .sendVerificationEmailToCurrentUser();
                //         await showDialog(
                //           context: context,
                //           builder: (context) {
                //             return FutureProgressDialog(
                //               future,
                //               message: Text("Reenviar correo de verificación"),
                //             );
                //           },
                //         );
                //       }
                //       return;
                //     }
                //     await Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => CartScreen(),
                //       ),
                //     );
                //     await refreshPage();
                //   },
                // ),
                SizedBox(height: getProportionateScreenHeight(5)),
                DiscountBanner(
                  images: "assets/images/banner-shopping.jpg",
                ),
                SizedBox(height: getProportionateScreenHeight(5)),
                Categoriastitle(
                  customFontColor: Colors.white,
                customColor: kShopColor,
                text:
                    "Comprar con amigos nunca ha \nsido tan lucrativo y divertido!",),
                SizedBox(height: getProportionateScreenHeight(5)),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.30,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 10,
                      children: [
                        ...List.generate(
                          productCategories.length,
                          (index) {
                            return Container(
                              width: SizeConfig.screenWidth * 0.31,
                              child: ProductTypeBox(
                                icon: productCategories[index][ICON_KEY],
                                title: productCategories[index][TITLE_KEY],
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CategoryProductsScreen(
                                        productType: productCategories[index]
                                            [PRODUCT_TYPE_KEY],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(5)),
                IconsTabs(0xFFFF710F),
                SizedBox(height: getProportionateScreenHeight(10)),
                SpecialOffertSmall(),
                SizedBox(height: getProportionateScreenHeight(10)),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.5,
                  child: ProductsSection(
                    sectionTitle: "PRODUCTOS DESTACADOS",
                    productsStreamController: favouriteProductsStream,
                    emptyListMessage: "Agrega tus Favoritos",
                    onProductCardTapped: onProductCardTapped,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.8,
                  child: ProductsSection(
                    sectionTitle: "PRODUCTOS EN OFERTA",
                    productsStreamController: allProductsStream,
                    emptyListMessage: "Parece que todas las tiendas están cerradas",
                    onProductCardTapped: onProductCardTapped,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(80)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> refreshPage() {
    favouriteProductsStream.reload();
    allProductsStream.reload();
    return Future<void>.value();
  }

  void onProductCardTapped(String productId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(productId: productId),
      ),
    ).then((_) async {
      await refreshPage();
    });
  }
}
