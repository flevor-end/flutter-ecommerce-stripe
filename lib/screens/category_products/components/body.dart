import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:masdamas/components/icon_button_with_counter.dart';
import 'package:masdamas/components/nothingtoshow_container.dart';
import 'package:masdamas/components/product_card_category.dart';
import 'package:masdamas/components/rounded_icon_button.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/models/Product.dart';
import 'package:masdamas/screens/product_details/product_details_screen.dart';
import 'package:masdamas/screens/products/components/products_filter.dart';
import 'package:masdamas/services/data_streams/category_products_stream.dart';
import 'package:masdamas/size_config.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';


class Body extends StatefulWidget {
  int colorVal;

  final ProductType productType;

  Body({
    Key key,
    @required this.productType,this.colorVal,
  }) : super(key: key);

  @override
  _BodyState createState() =>
      _BodyState(categoryProductsStream: CategoryProductsStream(productType));
}

class _BodyState extends State<Body>
    with SingleTickerProviderStateMixin{

  TabController _tabController;

  Color PrimaryColor = Color(0xFFFF710F);

  final CategoryProductsStream categoryProductsStream;

  _BodyState({@required this.categoryProductsStream});

  @override
  void initState() {
    super.initState();
    categoryProductsStream.init();
    _tabController = new TabController(
      vsync: this,
      length: 5,
    );
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      widget.colorVal = 0xFFFF710F;
    });
  }

  @override
  void dispose() {
    super.dispose();
    categoryProductsStream.dispose();
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
                horizontal: getProportionateScreenWidth(10)),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(05)),
                  buildHeadBar(),
                  SizedBox(height: getProportionateScreenHeight(05)),
                  // SizedBox(
                  //   height: SizeConfig.screenHeight * 0.13,
                  //   child: buildCategoryBanner(),
                  // ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.68,
                    child: StreamBuilder<List<String>>(
                      stream: categoryProductsStream.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<String> productsId = snapshot.data;
                          if (productsId.length == 0) {
                            return Center(
                              child: NothingToShowContainer(
                                secondaryMessage:
                                    "No hay productos en ${EnumToString.convertToString(widget.productType)}",
                              ),
                            );
                          }

                          return buildProductsGrid(productsId);
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          final error = snapshot.error;
                          Logger().w(error.toString());
                        }
                        return Center(
                          child: NothingToShowContainer(
                            iconPath: "assets/icons/network_error.svg",
                            primaryMessage: "Something went wrong",
                            secondaryMessage: "Unable to connect to Database",
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeadBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoundedIconButton(
          iconData: Icons.arrow_back_ios,
          press: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(width: 5),
        Expanded(
          child: 
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                EnumToString.convertToString(widget.productType),
                style: TextStyle(
                  color: kSecondaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
        IconButtonWithCounter(
          svgSrc: "assets/icons/filtro.svg",
          numOfItems: 0,
          press: () {
          showDialog(
            context: context, 
            builder: (buildcontext) => ProductFilter());},
        ),
      ],
    );
  }

  Future<void> refreshPage() {
    categoryProductsStream.reload();
    return Future<void>.value();
  }

  // Widget buildCategoryBanner() {
  //   return Stack(
  //     children: [
  //       Container(
  //         decoration: BoxDecoration(
  //           image: DecorationImage(
  //             image: AssetImage(bannerFromProductType()),
  //             fit: BoxFit.fill,
  //             colorFilter: ColorFilter.mode(
  //               kShopColor,
  //               BlendMode.hue,
  //             ),
  //           ),
  //           borderRadius: BorderRadius.circular(30),
  //         ),
  //       ),
        
  //       Align(
  //         alignment: Alignment.centerLeft,
  //         child: Padding(
  //           padding: const EdgeInsets.only(left: 16),
  //           child: Text(
  //             EnumToString.convertToString(widget.productType),
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontWeight: FontWeight.w900,
  //               fontSize: 24,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget buildProductsGrid(List<String> productsId) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        //color: Color(0xFFF5F6F9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: productsId.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProductCardCategory(
            productId: productsId[index],
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(
                    productId: productsId[index],
                  ),
                ),
              ).then(
                (_) async {
                  await refreshPage();
                },
              );
            },
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.65,
          crossAxisSpacing: 1,
          mainAxisSpacing: 8,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 12,
        ),
      ),
    );
  }

  String bannerFromProductType() {
    switch (widget.productType) {
      case ProductType.Tecnologia:
        return "assets/images/electronics_banner.jpg";
      case ProductType.Hogar:
        return "assets/images/books_banner.jpg";
      case ProductType.Cocina:
        return "assets/images/fashions_banner.jpg";
      case ProductType.Moda:
        return "assets/images/groceries_banner.jpg";
      case ProductType.Deportes:
        return "assets/images/arts_banner.jpg";
      case ProductType.Esports:
        return "assets/images/others_banner.jpg";
      default:
        return "assets/images/others_banner.jpg";
    }
  }
}
