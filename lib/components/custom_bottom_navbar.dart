
import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/enums.dart';
import 'package:masdamas/screens/Cart/cart_screen.dart';
import 'package:masdamas/screens/home/home.screen.dart';
import 'package:masdamas/screens/mis_grupos/index_grupos.dart';
import 'package:masdamas/screens/profile/profile_screen.dart';
import 'package:masdamas/validations/components/Validator_general.dart';



class CustomBottomNavBar extends StatefulWidget {

  const CustomBottomNavBar({
    Key key,
    this.selectedMenu,this.color,this.color2,this.color3
  }) : super(key: key);

  final MenuState selectedMenu;
  final bool color,color2,color3;

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  bool inActiveIconColor,inActiveIconColor2,inActiveIconColor3;
  
 @override
  void initState() {
    super.initState();
    inActiveIconColor2=widget.color2;
    inActiveIconColor=widget.color;
    inActiveIconColor3=widget.color3;
  }

  @override
  Widget build(BuildContext context) {
   
    
 
    return Container(
      height: 45,
      decoration: BoxDecoration(color: kSecondaryColor, boxShadow: [
        // BoxShadow(
        //     offset: Offset(0, -15),
        //     blurRadius: 20,
        //     color: Color(0xFF343434).withOpacity(0.6)),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  HomeScreen.routeName, (Route<dynamic> route) => false);
            },
            child: Container(
              margin: EdgeInsets.only(left: 2, top: 3, bottom: 2),
              decoration: BoxDecoration(
                  color: inActiveIconColor?kPrimaryColor:kSecondaryColor, borderRadius: BorderRadius.circular(6)),
              width: 67,
              child: SizedBox(
                width: 64,
                height: 40,
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 3,
                      child: Container(
                        padding: EdgeInsets.only(top: 3),
                        decoration: BoxDecoration(
                            //color: kSecondaryColor.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(10)),
                        child:  inActiveIconColor? Image.asset("assets/icons/icono_home.png",):Image.asset("assets/icons/icono_home_off.png",),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                          width: 55,
                          child: Text('Inicio',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(color: Colors.white, height: 40, width: 1.5),
          GestureDetector(
            onTap: () {},
            child: Container(
                margin: EdgeInsets.only(left: 5, bottom: 2),
              decoration: BoxDecoration(
                  color: kSecondaryColor, borderRadius: BorderRadius.circular(6)),
              width: 67,
              child: SizedBox(
                width: 64,
                height: 40,
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 2.5,
                      child: Container(
                        padding: EdgeInsets.only(top: 7,),
                        decoration: BoxDecoration(
                            //color: kSecondaryColor.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset("assets/icons/misamigosicon.png",
                            ),
                      ),
                    ),
                    Text('Mis Amigos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
          Container(color: Colors.white, height: 40, width: 1.5),
          GestureDetector(
            onTap: () {Navigator.of(context).pushNamedAndRemoveUntil(
                  IndexGrups.routeName, (Route<dynamic> route) => false);},
            child: Container(
              margin: EdgeInsets.only( top: 2),
                  decoration: BoxDecoration(
                  color: inActiveIconColor2?kPrimaryColor:kSecondaryColor, borderRadius: BorderRadius.circular(6)),
              child: SizedBox(
                width: 64,
                height: 40,
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 2.5,
                      child: Container(
                        padding: EdgeInsets.only(top: 7),
                        decoration: BoxDecoration(
                            //color: kSecondaryColor.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(10)),
                        child:inActiveIconColor2? Image.asset(
                          "assets/images/rojogrupos.png",
                        ):Image.asset(
                          "assets/images/gruposicono.png",
                        )
                      ),
                    ),
                    Text('Mis Grupos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
          Container(color: Colors.white, height: 40, width: 1.5),
          GestureDetector(
            onTap: () {
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => InicialE(destino:CartScreen(),)));
            },
            child: SizedBox(
              width: 64,
              height: 40,
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 2.5,
                    child: Container(
                      padding: EdgeInsets.only(top: 7),
                      decoration: BoxDecoration(
                          //color: kSecondaryColor.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset("assets/icons/milistaicon.png",
                          ),
                    ),
                  ),
                  Text('Carrito',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))
                ],
              ),
            ),
          ),
          Container(color: Colors.white, height: 40, width: 1.5),
           GestureDetector(
            onTap: () {
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => InicialE(destino:ProfileScreen(),)));
            },
            child: Container(
              margin: EdgeInsets.only(left: 1, top: 3, bottom: 2,right: 2),
              decoration: BoxDecoration(
                  color:inActiveIconColor3?kPrimaryColor:kSecondaryColor, borderRadius: BorderRadius.circular(6)),
              width: 65,
              child: SizedBox(
                width: 64,
                height: 40,
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 2.8,
                      child: Container(
                        padding: EdgeInsets.only(top: 3,left: 8),
                        decoration: BoxDecoration(
                            //color: kSecondaryColor.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(10)),
                        child:inActiveIconColor3?Image.asset("assets/icons/icono_espacio_rojo.png"): Image.asset("assets/icons/miespacioicon.png",)
                      ),
                    ),
                    ClipRRect(
                      
                      child: Container(
                          width: 60,
                          child: Text('Mi Espacio',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}