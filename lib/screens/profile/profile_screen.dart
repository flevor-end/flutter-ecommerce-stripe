import 'package:flutter/material.dart';
import 'package:masdamas/components/custom_bottom_navbar.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/home/components/home_header.dart';

import 'components/body.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/profile';
 
 

  @override
  _ProfileScreenState createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> {

  PageController _tabPageController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabPageController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        iconTheme: IconThemeData(
          color: kSecondaryColor,
        ),
        leading: Container(),
        flexibleSpace: HomeHeader(),
      ),
     
      body:SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Body(), 
          ],

        ),
      ),
      bottomNavigationBar:CustomBottomNavBar(color: false,color2: false,color3: true,),
    );
  }
}
