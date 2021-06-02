import 'package:flutter/material.dart';
import 'package:masdamas/components/buttons_tabbar.dart';
import 'package:masdamas/components/custom_bottom_navbar.dart';
import 'package:masdamas/screens/Domicilios/Domicilio_screen.dart';
import 'package:masdamas/screens/Forless/forless_screen.dart';
import 'package:masdamas/screens/Services/services_screen.dart';
import 'package:masdamas/screens/home/components/home_header.dart';
import 'package:masdamas/screens/home/components/screen_args.dart';
import 'package:masdamas/screens/macro/macro_screen.dart';

import '../../constants.dart';
import 'components/body.dart';

class CategoriesScreen extends StatelessWidget {
  static String routeName = 'categories';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          body: Container(
            child: TabBarView(children: <Widget>[
              Body(),
              DomicilioScreen(),
              ServicesScreen(),
              ForlessScreen(),
              MacroScreen()
            ]),
          ),
          bottomNavigationBar: CustomBottomNavBar()
        ),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    flexibleSpace: HomeHeader(
      state: "false",
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(50), // here the desired height
      child: Container(
        padding: EdgeInsets.only(top: 3, bottom: 3),
        color: kPrimaryColor,
        child: ButtonsTabBar(
          contentPadding: EdgeInsets.only(left: 1, right: 1),
          borderColor: Colors.transparent,
          backgroundColor: kSecondaryColor,
          unselectedBackgroundColor: Colors.white,
          unselectedLabelStyle: TextStyle(
              color: kSecondaryColor,
              fontSize: 10.5,
              fontWeight: FontWeight.w700),
          borderWidth: 1,
          unselectedBorderColor: Colors.transparent,
          radius: 8,
          labelStyle: TextStyle(
              color: Colors.white, fontSize: 10.5, fontWeight: FontWeight.w700),
          tabs: [
            Tab(
              text: "       MAS\n   Shopping",
            ),
            Tab(
              text: "       MAS\n  Domicilios",
            ),
            Tab(
              text: "       MAS\n   Servicios ",
            ),
            Tab(
              text: "       MAS\n Optimizado",
            ),
            Tab(
              text: "       MAS\n   Personal",
            ),
          ],
        ),
      ),
    ),
  );
}
