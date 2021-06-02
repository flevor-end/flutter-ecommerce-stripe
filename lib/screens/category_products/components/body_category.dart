import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/models/Product.dart';
import 'package:masdamas/screens/Domicilios/Domicilio_screen.dart';
import 'package:masdamas/screens/Forless/forless_screen.dart';
import 'package:masdamas/screens/Services/services_screen.dart';
import 'package:masdamas/screens/category_products/components/body.dart';
import 'package:masdamas/screens/macro/macro_screen.dart';
import 'package:masdamas/screens/category_products/components/SubCategory_Tabs.dart';
import 'package:masdamas/screens/shop/home_screen.dart';


class BodyProduct extends StatefulWidget {
  final ProductType productType;
  int colorVal;
  BodyProduct({
    Key key,
    @required this.productType,this.colorVal,
  }) : super(key: key);
  

  @override
  _BodyProductState createState() => _BodyProductState();
}

class _BodyProductState extends State<BodyProduct>
    with SingleTickerProviderStateMixin {

  TabController _tabController;

  Color PrimaryColor = Color(0xFFFF710F);


  @override
  void initState() {
    super.initState();
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
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFEFF0F1),
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      child: Padding(
        padding: EdgeInsets.only(top: 3.0,),
        child: innerNestedTabs(),
      ),
    );
  }

  Widget innerNestedTabs() {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 5,
        child: new Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                child: AppBar(
                  leading: Container(),
              bottom: TabBar(
                labelPadding:
                    EdgeInsets.symmetric( horizontal: 8.5),
                unselectedLabelColor: kSecondaryColor,
                isScrollable: true,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: PrimaryColor,
                ),
                onTap: (index) {
                  setState(() {
                    switch (index) {
                        case 0:
                          PrimaryColor = Color(0xFFFF710F);
                          break;
                        case 1:
                          PrimaryColor = Color(0xFF744774);
                          break;
                        case 2:
                          PrimaryColor = Color(0xFFF5B300);
                          break;
                        case 3:
                          PrimaryColor = Color(0xFF008145);
                          break;
                        case 4:
                          PrimaryColor = Color(0xFF00369B);
                          break;
                        default:
                    }
                  });
                },
                tabs: <Widget>[
                  Tab(
                    child: Container(
                        width: size.width * 0.14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'MAS \nShopping',
                            style: TextStyle(fontSize: 11.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ),
                  ),
                  Tab(
                    child: Container(
                        width: size.width * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'MAS \nDomicilios',
                            style: TextStyle(fontSize: 11.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ),
                  ),
                  Tab(
                    child: Container(
                        width: size.width * 0.14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'MAS \nServicios',
                            style: TextStyle(fontSize: 11.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ),
                  ),
                  Tab(
                    child: Container(
                        width: size.width * 0.17,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'MAS \nOptimizado',
                            style: TextStyle(fontSize: 11.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ),
                  ),
                  Tab(
                    child: Container(
                        width: size.width * 0.14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'MAS \nAliados',
                            style: TextStyle(fontSize: 11.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
        body: TabBarView(children: <Widget>[
            Body(
            productType: widget.productType,
            ),
            DomicilioScreen(),
            ServicesScreen(),
            ForlessScreen(),
            MacroScreen()
          ]),
        ));
  }
}
