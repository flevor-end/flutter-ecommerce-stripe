import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/components/custom_bottom_navbar.dart';
import 'package:masdamas/components/custom_bottom_secondary.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/components/avatar.dart';
import 'package:masdamas/screens/home/components/home_header.dart';
import 'package:masdamas/screens/home/components/special_offers.dart';
import 'package:masdamas/screens/profile/profile_screen.dart';
import 'package:masdamas/screens/sign_up/registro.dart';
import 'package:masdamas/validations/components/Validator_general.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import '../../sizec.dart';
import 'components/masdamas.dart' as mas ;
import 'components/screen_args.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home';
  HomeScreen(this.index);
  int index;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
  Widget build(BuildContext context) {
    Sizec().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kSecondaryColor,
        ),
        flexibleSpace: HomeHeader(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         
        HomePage(),
        CustomBottomNavBar(color: true,color2: false,color3: false,)
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String ubication = "     Tu Ubicacion";
    final LocalAuthentication oauth = LocalAuthentication();
    bool login= false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
     oauth.canCheckBiometrics;
     getSecure(); 
  }
 void getSecure() async {
    if(_auth.currentUser!= null){
    setState(() {
      login= true;
    });
    }
  }
  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height:Sizec.screenHeight>700 ?20:0,),
          Container(
            padding: EdgeInsets.all(Sizec.screenWidth/34),
            height: Sizec.screenHeight/2.93,
            color: Colors.white,
            child: 
      Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       BtnHomepage(color: Colors.orange[800],text:"MAS SHOPPING",image: "assets/images/comprasiniciopng.png",colortext:kSecondaryColor,width: 0.7,press: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            mas.Masdamas.routeName, (Route<dynamic> route) => false,
                            arguments: ScreenArguments(0));
                      },),
       BtnHomepage(color: Color(0xFF744774),text:"MAS DOMICILIOS",image: "assets/images/bannerinicio2.png",colortext: Colors.white,width: 0.81,press: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            mas.Masdamas.routeName, (Route<dynamic> route) => false,
                            arguments: ScreenArguments(1));
                      },),
       BtnHomepage(color: Color(0xFFF5B300),text:"MAS SERVICIOS",image: "assets/images/bannerinicio3.png",colortext:kSecondaryColor,width: 0.728,press: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            mas.Masdamas.routeName, (Route<dynamic> route) => false,
                            arguments: ScreenArguments(2));
                      },),
       BtnHomepage(color: Color(0xFF008145),text:"MAS OPTIMIZADO",image:"assets/images/bannerinicio4.png",colortext:Colors.white,width:0.87,press: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            mas.Masdamas.routeName, (Route<dynamic> route) => false,
                            arguments: ScreenArguments(3));
                      },),
       BtnHomepage(color: Color(0xFF00369B),text:"MAS ALIADOS",image: "assets/images/bannerinicio5.png",colortext: Color(0xFFF5B300),width:0.56,press: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            mas.Masdamas.routeName, (Route<dynamic> route) => false,
                            arguments: ScreenArguments(4));
                      },
                      ),
                  ],
                ),             
            ),
            SizedBox(height:Sizec.screenHeight>800 ?20:0,),
        login? Row(   mainAxisAlignment: MainAxisAlignment.center, 
        children: [  
        // Center(
        //   child: 
        //     Avatar(
        //       tamano: 16,
        //     ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(1),
        //   child: Align(
        //     widthFactor: 1.3,
        //     child: 
        //     Text(_auth.currentUser.displayName,style:TextStyle(fontSize: 15,fontWeight:FontWeight.bold ) ,)
        //   ),
        // )
            ],):Row(children:[
          
         BtnHomepages(text:"INGRESA",width: 14,left: Sizec.screenWidth/60,rigth: 0,image:"assets/icons/icono1inicio.svg" ,letra: 13,press:(){  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => InicialE(destino:ProfileScreen(),)),
  );},),
         BtnHomepages(text:"REGISTRATE",width:8,left: 0,rigth: Sizec.screenWidth/60,image: "assets/icons/icono2inicio.svg",letra: 13,press:(){ Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Registro(),));
  } ,),], mainAxisAlignment: MainAxisAlignment.spaceAround,),
          SizedBox(height: 10,),
         Row(children:[
         BtnHomepages(text:"REGISTRA EMPRESA",left:  Sizec.screenWidth/60,rigth: 0,image:"assets/icons/icono4inicio.svg" ,letra:10.6 ,press: (){ },),
         BtnHomepages(text:"REGISTRA SERVICIOS",left: 0,rigth: Sizec.screenWidth/60,image:"assets/icons/icono3inicio.svg" ,letra:10,),
          ], 
          mainAxisAlignment: MainAxisAlignment.spaceAround,), 
          SizedBox(height:Sizec.screenHeight>800 ?20:0,),
          SpecialOffers(),
          CustomBottomSecondary(selectedMenu:null ,inActiveIconColor: null,)
        ],
      )),
    );
  }
}

 class BtnHomepage extends StatelessWidget {
   const BtnHomepage({
     Key key,
     this.text,
    this.press,
    this.color,
    this.image,
    this.colortext,
    this.width,
   }) : super(key: key);

   final String text,image;
   final Function press;
   final Color color,colortext;
   final double width;

  @override
   Widget build(BuildContext context) {
     return   SizedBox(
      width: Sizec.screenWidth,
      height: getProportionateScreenHeight(45),
      child: MaterialButton(
        padding: EdgeInsets.only(left:1,right: 1),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        side: BorderSide(width: 1.5, color: kSecondaryColor)),
        onPressed: press,
        child: Row(
        children: [   
        Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(6),bottomLeft:Radius.circular(6)),
          color: color,
      ),
           width: 210,
           child:Column(
           children: [
            SizedBox(height: Sizec.screenHeight/260),
            Align(alignment: Alignment.centerRight,widthFactor: width, child:Text(text,style:TextStyle(color:colortext,fontSize: 19,fontWeight:FontWeight.bold ,),),),
            Align(alignment: Alignment.centerRight,heightFactor: Sizec.screenHeight/1600,widthFactor: 0.78 , child:Text("Texto descriptivo de una linea ",style:TextStyle(color:colortext,fontSize: 11 ),),),     

           ],)
           ),
         Align( child:Container(

           child:Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: Sizec.screenWidth>400?Sizec.screenWidth/2.34:Sizec.screenWidth/2.67,
                    height: Sizec.screenHeight/19,
                  ),
         ),
         ),

        ],)
         
        ),
      );
   }
}


 class BtnHomepages extends StatelessWidget {
   const BtnHomepages({
     Key key,
    this.text,
    this.press,
    this.image,
    this.width,
    this.left,
    this.rigth,
    this.letra
   }) : super(key: key);

   final String text,image;
   final Function press;
   final double width,left,rigth,letra;

  @override
   Widget build(BuildContext context) {
     return  Container(
           padding: EdgeInsets.only(left: left,right:rigth),
           child: SizedBox(
      width: Sizec.screenWidth/2.17,
      height: getProportionateScreenHeight(42),
      child: FlatButton(
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
              side: BorderSide(width: 1.5, color: kSecondaryColor)),
        onPressed: press,
        child:  Row(
                children: <Widget>[
                  Container(
                    height: 23,

                    child: SvgPicture.asset(
                      image,
                      width: 30,
                    ),
                  ),
                  SizedBox(width:width),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: letra,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
      ),
    ),
         );
   }

 }
