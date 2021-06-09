import 'package:masdamas/components/custom_bottom_navbar.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/Domicilios/Domicilio_screen.dart';
import 'package:masdamas/screens/Forless/forless_screen.dart';
import 'package:masdamas/screens/Services/services_screen.dart';
import 'package:masdamas/screens/home/components/home_header.dart';
import 'package:masdamas/screens/home/components/screen_args.dart';
import 'package:masdamas/screens/macro/macro_screen.dart';
import 'package:masdamas/screens/shop/home_screen.dart';
import 'package:masdamas/screens/shopping/shopping_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen_drawer.dart';



class Masdamas extends StatefulWidget {
  static const routeName = '/extractArguments';

  @override
  _MasdamasState createState() => _MasdamasState();
}

PageController _tabPageController;
  int _selectedTab = 0;

class _MasdamasState extends State<Masdamas> {
  Color PrimaryColor = Color(0xFFFF710F);

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: args.index,
      length: 5,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(125),
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                child: AppBar(
         flexibleSpace: HomeHeader(),
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
                      ),
          ),
          //buildAppBar(),
          body: TabBarView(children: <Widget>[
            ShopScreen(),
            DomicilioScreen(),
            ServicesScreen(),
            ForlessScreen(),
            MacroScreen()
          ]),
          bottomNavigationBar:  CustomBottomNavBar(color: false,color2: false,color3: false,),
          //drawer: HomeScreenDrawer(),
         
      ),
      
    );
  }

//   AppBar buildAppBar() {
//     return AppBar(
//       //backgroundColor: Colors.white,
//       elevation: 0,
//       iconTheme: IconThemeData(color: Colors.black),
//       flexibleSpace: HomeHeader(),
//       bottom: PreferredSize(
//         preferredSize: Size.fromHeight(50), // here the desired height
//         child: Container(
//           padding: EdgeInsets.only(top: 3, bottom: 3),
//           //color: kPrimaryColor,
//           child: ButtonsTabBar(
//             contentPadding: EdgeInsets.only(left: 1, right: 1),
//             borderColor: Colors.orange,
//             backgroundColor: kSecondaryColor,
//             unselectedBackgroundColor: Colors.white,
//             unselectedLabelStyle: TextStyle(
//                 color: kSecondaryColor,
//                 fontSize: 10.5,
//                 fontWeight: FontWeight.w700),
//             borderWidth: 1,
//             unselectedBorderColor: Colors.transparent,
//             radius: 8,
//             labelStyle: TextStyle(
//                 color: Colors.white,
//                 fontSize: 10.5,
//                 fontWeight: FontWeight.w700),
//             tabs: [
//               Tab(
//                 text: "MAS \nShopping",
//               ),
//               Tab(
//                 text: "MAS \nDomicilios",
//               ),
//               Tab(
//                 text: "MAS \nServicios ",
//               ),
//               Tab(
//                 text: "MAS \nOptimizado",
//               ),
//               Tab(
//                 text: "MAS \nPersonal",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

}