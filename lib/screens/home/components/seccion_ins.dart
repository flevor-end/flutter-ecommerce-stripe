import 'package:masdamas/components/buttons_tabbar.dart';
import 'package:masdamas/components/custom_bottom_navbar.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/home/components/home_header.dart';
import 'package:masdamas/screens/home/components/screen_args.dart';
import 'package:flutter/material.dart';
import 'package:masdamas/screens/home/components/soporte.dart';
import 'package:masdamas/screens/home/components/unidos.dart';

import 'nosotros.dart';
import 'oportunidades.dart';



class SeccionIns extends StatefulWidget {
  static const routeName = '/Seccion_ins';

  @override
  _SeccionInsState createState() => _SeccionInsState();
}

class _SeccionInsState extends State<SeccionIns> {


  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: args.index,
      length: 4,
      child: SafeArea(
        child: Scaffold(
      
          appBar: AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      flexibleSpace: HomeHeader(),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60), // here the desired height
        child: Container(
          color:Colors.transparent,
          child: ButtonsTabBar(
            contentPadding: EdgeInsets.only(left: 2, right: 2),
            borderColor: Colors.transparent,
            backgroundColor: kPrimaryColor,
            unselectedBackgroundColor: Colors.white,
            unselectedLabelStyle: TextStyle(
                color: kSecondaryColor,
                fontSize: 10.5,
                fontWeight: FontWeight.w700),
            borderWidth: 2,
            unselectedBorderColor: kPrimaryColor,
            radius: 8,
            labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 10.5,
                fontWeight: FontWeight.w700),
            tabs: [
              Tab(
                text: "Nosotros",
              ),
            
              Tab(
                text: "Soporte",
              ),
              Tab(
                text: "Unidos",
              ),
              Tab(
                text: "Oportunidades",
              ),
            ],
          ),
        ),
      ),
    ),
          //buildAppBar(),
          body: TabBarView(children: <Widget>[
            Nosotros(),
            Soporte(),
            Unidos(),
            Oportunidades(),           
          ]),
          bottomNavigationBar:  CustomBottomNavBar(color: true,color2: false,color3: false,),
         
      ),
      )
    );
  }
}
