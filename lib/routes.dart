import 'package:flutter/widgets.dart';
import 'package:masdamas/components/cam_dialog.dart';
import 'package:masdamas/components/huella_new.dart';
import 'package:masdamas/components/mapScreen.dart';
import 'package:masdamas/components/mic_screen.dart';
import 'package:masdamas/components/page_transicion.dart';
import 'package:masdamas/screens/cart/cart_screen.dart';
import 'package:masdamas/screens/categories/categories_screen.dart';
import 'package:masdamas/screens/complete_profile/complete_profile_screen.dart';
import 'package:masdamas/screens/details/details_screen.dart';
import 'package:masdamas/screens/home/components/home_header.dart';
import 'package:masdamas/screens/home/components/masdamas.dart';
import 'package:masdamas/screens/home/home.screen.dart';
import 'package:masdamas/screens/mis_grupos/index_grupos.dart';
import 'package:masdamas/screens/profile/components/body.dart';
import 'package:masdamas/screens/shopping/components/chat.dart';
import 'package:masdamas/screens/shopping/shopping_screen.dart';
import 'package:masdamas/screens/sign_in/login.dart';
import 'package:masdamas/screens/otp/otp_screen.dart';
import 'package:masdamas/screens/profile/profile_screen.dart';
import 'package:masdamas/screens/sign_up/registro.dart';
import 'package:masdamas/screens/sign_up/registro_exitoso.dart';
import 'package:masdamas/screens/sign_up/registro_perfil.dart';
import 'package:masdamas/screens/splash/splash_screen.dart';
import 'components/camscreen.dart';
import 'screens/home/components/seccion_ins.dart';
import 'screens/sign_up/codigo_sms.dart';
import 'screens/splashscreen.dart';

final Map<String, WidgetBuilder> routes = {

  SplashScreen.routeName: (context) => new SplashScreen(),
  Login.routeName: (context) => new Login(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(0),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  //CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  Registro.routeName: (context) => Registro(),
  SplashScreen2.routeName: (context) => new SplashScreen2(),
  Masdamas.routeName: (context) => Masdamas(),
  ShoppingScreen.routeName: (context) => ShoppingScreen(),
  CategoriesScreen.routeName: (context) => CategoriesScreen(),
  Mapscreen.routeName:(context) => Mapscreen(),
  HomeHeader.routeName:(context) =>HomeHeader(),
  CamDialog.routeName:(context) =>CamDialog(destino:[],),
  Micscreen.routeName:(context) =>Micscreen(),
  Camscreen.routeName:(context) =>Camscreen(),
  Codigosms.routeName:(context) =>Codigosms(),
  Perfilregistro.routeName:(context) =>Perfilregistro(),
  RegistroExitoso.routeName:(context) =>RegistroExitoso(),
  HuellaNew.routeName:(context) =>HuellaNew(),
  SeccionIns.routeName:(context) =>SeccionIns(),
  SimpleCropRoute.routeName:(context) =>SimpleCropRoute(),
  Transicion.routeName:(context) =>Transicion(),
  Chat.routeName:(context) => Chat(), 
  IndexGrups.routeName:(context) => IndexGrups(), 
};

int index;
