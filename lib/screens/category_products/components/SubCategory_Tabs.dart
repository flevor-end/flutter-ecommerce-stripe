import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/models/Product.dart';
import 'package:masdamas/screens/category_products/components/body.dart';
import 'package:masdamas/screens/details/details_screen.dart';
import 'package:masdamas/screens/category_products/components/body_category.dart';
import 'package:masdamas/screens/product_details/components/product_type_box.dart';
import 'package:masdamas/screens/products/components/products_filter.dart';

import '../../products/components/body_tab_subcategory.dart';

class SubCategoryProductTabs extends StatefulWidget {
  
  SubCategoryProductTabs(
    
    this.colorVal,
    );
  int colorVal;

  @override
  _SubCategoryProductTabsState createState() => _SubCategoryProductTabsState();
}

class _SubCategoryProductTabsState extends State<SubCategoryProductTabs>
    with SingleTickerProviderStateMixin {


  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 6, vsync: this);
    _tabController.addListener(_handleTabSelection);

  }

  void _handleTabSelection() {
    setState(() {
      widget.colorVal = 0xFFFF710F;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var productType;
        return DefaultTabController(
            length: 6,
            child: Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),
               backgroundColor: kSecondaryColor,
                title:  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('CATEGORIA', style: TextStyle(color: Colors.white)),
                    SizedBox(
                      width:size.width * 0.3,
    
                    ),
                    GestureDetector(
                      onTap: () {showDialog(context: context, builder: (buildcontext) => ProductFilter());},
                      
                      child: SvgPicture.asset("assets/icons/filtro.svg"))
    
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(60),
                              child: Container(
                                color: Colors.white,
                                child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorWeight: 2.0,
                    indicatorColor: Color(0xFFFF710F),
                    unselectedLabelColor: Colors.grey,
                    tabs: <Widget>[
                      Tab(
                        icon: SvgPicture.asset("assets/icons/laptop.svg",
                            width: size.width * 0.10,
                            height: size.height * 0.04,
                            color: _tabController.index == 0
                                  ? Color(widget.colorVal)
                                  : kSecondaryColor.withOpacity(0.24)),
                        child: Text(
                          'Computadores',
                          style: TextStyle(
                                fontSize: 12,
                                color: _tabController.index == 0
                                    ? Color(widget.colorVal)
                                    : kSecondaryColor.withOpacity(0.46)),
                        ),
                      ),
                      Tab(
                        icon: SvgPicture.asset("assets/icons/celular.svg",
                            width: size.width * 0.10,
                            color: _tabController.index == 1
                                  ? Color(widget.colorVal)
                                  : kSecondaryColor.withOpacity(0.24)),
                        child: Text(
                          'Celulares',
                          style: TextStyle(
                                fontSize: 12,
                                color: _tabController.index == 1
                                    ? Color(widget.colorVal)
                                    : kSecondaryColor.withOpacity(0.46)),
                        ),
                      ),
                      Tab(
                        icon: SvgPicture.asset("assets/icons/soft.svg",
                            width: size.width * 0.10,
                            height: 34,
                            color: _tabController.index == 2
                                  ? Color(widget.colorVal)
                                  : kSecondaryColor.withOpacity(0.24)),
                        child: Text(
                          'Software',
                          style: TextStyle(
                                fontSize: 12,
                                color: _tabController.index == 2
                                    ? Color(widget.colorVal)
                                    : kSecondaryColor.withOpacity(0.46)),
                        ),
                      ),
                      Tab(
                        icon: SvgPicture.asset("assets/icons/iWatch.svg",
                            width: size.width * 0.10,
                            color: _tabController.index == 3
                                  ? Color(widget.colorVal)
                                  : kSecondaryColor.withOpacity(0.24)),
                        child: Text(
                          'watchs',
                          style: TextStyle(
                                fontSize: 12,
                                color: _tabController.index == 3
                                    ? Color(widget.colorVal)
                                    : kSecondaryColor.withOpacity(0.46)),
                        ),
                      ),
                      Tab(
                        icon: SvgPicture.asset("assets/icons/headphone.svg",
                            width: size.width * 0.10,
                            height: 34,
                            color: _tabController.index == 4
                                  ? Color(widget.colorVal)
                                  : kSecondaryColor.withOpacity(0.24)),
                        child: Text(
                          'Audifonos',
                          style: TextStyle(
                                fontSize: 12,
                                color: _tabController.index == 4
                                    ? Color(widget.colorVal)
                                    : kSecondaryColor.withOpacity(0.46)),
                        ),
                      ),
                      Tab(
                        icon: SvgPicture.asset("assets/icons/accesories.svg",
                            width: size.width * 0.10,
                            // color: _tabController.index == 5
                            //       ? Color(widget.colorVal)
                            //       : kSecondaryColor.withOpacity(0.24)
                                  ),
                        child: Text(
                          'accesorios',
                          style: TextStyle(
                                fontSize: 12,
                                color: _tabController.index == 5
                                    ? Color(widget.colorVal)
                                    : kSecondaryColor.withOpacity(0.46)),
                        ),
                      )
                    ],
                  ),
                              ),
                ),
              ),
              body: TabBarView(controller: _tabController, children: <Widget>[
                Body(productType: productType,
              
            ),
            BodyTabSubCategory(
              
            ),
            BodyTabSubCategory(
              
            ),
            BodyTabSubCategory(
              
            ),
            BodyTabSubCategory(
              
            ),
            BodyTabSubCategory(
              
            ),
          ]),
        ));
  }
}

