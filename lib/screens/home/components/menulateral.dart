import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:logger/logger.dart';
import 'package:masdamas/components/custom_text.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/components/avatar.dart';
import 'package:masdamas/screens/custom_expansion_tile.dart' as custom;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:masdamas/blocs/bloc_use.dart';
import 'package:masdamas/screens/edit_product/edit_product_screen.dart';
import 'package:masdamas/screens/my_orders/my_orders_screen.dart';
import 'package:masdamas/screens/my_products/my_products_screen.dart';
import 'package:masdamas/screens/payments/component/pay_card.dart';
import 'package:masdamas/screens/profile/components/dialog.dart';
import 'package:masdamas/services/authentification/authentification_service.dart';
import 'package:masdamas/services/database/user_database_helper.dart';
import 'package:masdamas/sizec.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../utils.dart';

class Iniciom extends StatefulWidget {
  @override
  _IniciomState createState() => new _IniciomState();
}

class _IniciomState extends State<Iniciom> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(canvasColor: Colors.transparent),
        home: Menulateral());
  }
}

class Menulateral extends StatefulWidget {
  @override
  _MenulateralState createState() => new _MenulateralState();
}

class _MenulateralState extends State<Menulateral> {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserBloc userBloc;
  signOut() async {
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    
    return new Dialog(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0))
),
      insetPadding: EdgeInsets.fromLTRB(0, 0, 180, Sizec.screenHeight>700?230:70),      
      child: dialogContent(context),
    );
  }
      
      
  dialogContent(BuildContext context) {
  String nombre= auth.currentUser?.displayName; 
  return  new Container(
  height:900,
  decoration: BoxDecoration(
    border: Border.all(color: kSecondaryColor,width: 2),
    borderRadius:BorderRadius.circular(5),
    color: Colors.white,
  ),
    child:
      ListView(
        physics: BouncingScrollPhysics(),
       children: <Widget>[
         
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(5)),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 2),
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: kSecondaryColor,
                      ),
                      onPressed: (){Navigator.of(context).pop();}),
                 SizedBox(width: 20),

                  Text(
                    'MENU',
                    textAlign:TextAlign.justify,
                    style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
            height: 72,
            width: 50,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(5),
                
              ),
              child: StreamBuilder<User>(
              stream: AuthentificationService().userChanges,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data;
                  return buildUserAccountsHeader(user);
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Center(
                    child: Icon(Icons.error),
                  );
                }
              }),
            
              
           ),
            ),
          

          Container(
            color: Colors.white,
            child: custom.ExpansionTile(
              title:   Text(
                    'MAS Shopping',
                    style: TextStyle(
                      color: kSecondaryColor, 
                      fontSize:14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                
              
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    "Tecnologia",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  children: <Widget>[
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      // set border width

                      child: Text("    Ropa"),
                    ),
                    Divider(),
                    //NIÑA DE 5 A 12
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      // set border width

                      child: Text("    Zapatos"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      // set border width
                      child: Text("    Bolsos"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,

                      child: Text("    Relojes"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Joyeria"),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("    Accesorios"),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Hogar",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  children: <Widget>[
                    //ROPA
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Ropa"),
                    ),
                    Divider(),
                    //NIÑA DE 5 A 12
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Niña (5-12) Años"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Niño (5-12) Años"),
                    ),
                    Divider(),

                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Bebe niño "),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Mini"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Accesorios"),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Moda",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Deportes",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Esports",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Infantil",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "joyeria",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Mascotas",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Cocina",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Viajes",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Hotel",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: custom.ExpansionTile(
              
                  title: Text(
                    'MAS Domicilios ',
                    style: TextStyle(
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.9),
                  ),
                
              
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    "Restaurantes",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  backgroundColor: Colors.white,
                  children: <Widget>[
                    //ROPA
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Ropa"),
                    ),
                    Divider(),
                    //NIÑA DE 5 A 12
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Niña (5-12) Años"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Niño (5-12) Años"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    bebe niño "),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    mini"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Accesorios"),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Cafes",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  children: <Widget>[
                    //ROPA
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Ropa"),
                    ),
                    Divider(),
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Niña (5-12) Años"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Niño (5-12) Años"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Bebe niño "),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    mini"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    accesorios"),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Mercado",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Express",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Fruver",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Drogueria",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Floristeria",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Ferreterias",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Licores",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  children: <Widget>[
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Ropa"),
                    ),
                    Divider(),
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Niña (5-12) Años"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Niño (5-12) Años"),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("    Bebe niño "),
                    ),
                    Divider(),
                    Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      child: Text("    mini"),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey, // set border color
                          //  width: 2.0
                        ), // set border width
                      ),
                      child: Text("    accesorios"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: custom.ExpansionTile(
              // leading: CircleAvatar(
              //     backgroundColor: Colors.green.withOpacity(.13),
              //     child: Icon(
              //       Icons.card_giftcard,
              //       color: Colors.green,
              //     )),
              title:Text(
                    'MAS Servicios',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                
              
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    "Logistica",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  children: <Widget>[
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      // set border width

                      child: Text("    Ropa"),
                    ),
                    Divider(),
                    //NIÑA DE 5 A 12
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      // set border width

                      child: Text("    Zapatos"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      // set border width
                      child: Text("    Bolsos"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,

                      child: Text("    Relojes"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Joyeria"),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("    Accesorios"),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Limpieza General",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  children: <Widget>[
                    //ROPA
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Ropa"),
                    ),
                    Divider(),
                    //NIÑA DE 5 A 12
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Niña (5-12) Años"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Niño (5-12) Años"),
                    ),
                    Divider(),

                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Bebe niño "),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Mini"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Accesorios"),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Cursos Virtuales",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Reparaciones al Hogar/oficina",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Reparacion de Electrodomestico",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Transporte Publico",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Transporte Privado",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Servicios publicos",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Instalaciones en casa/oficina",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Transporte Publico",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Ofertas Laborales",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Tratamiento Corporal",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Capacitacion Profesional",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ],
            ),
          ),
          Container(

            child: custom.ExpansionTile(
              // leading: CircleAvatar(
              //     backgroundColor: Colors.green.withOpacity(.13),
              //     child: Icon(
              //       Icons.card_giftcard,
              //       color: Colors.green,
              //     )),
              title: Text(
                    'MAS Optimizado',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                
          
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    "Computadores",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  children: <Widget>[
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      // set border width

                      child: Text("    Ropa"),
                    ),
                    Divider(),
                    //NIÑA DE 5 A 12
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      // set border width

                      child: Text("    Zapatos"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      // set border width
                      child: Text("    Bolsos"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,

                      child: Text("    Relojes"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Joyeria"),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("    Accesorios"),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Hogar",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  children: <Widget>[
                    //ROPA
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Ropa"),
                    ),
                    Divider(),
                    //NIÑA DE 5 A 12
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Niña (5-12) Años"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Niño (5-12) Años"),
                    ),
                    Divider(),

                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Bebe niño "),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Mini"),
                    ),
                    Divider(),
                    Container(
                      // margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text("    Accesorios"),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Oficina",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Juegos",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Moda",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Autopartes",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Muebles",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Maquinaria",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Antiguedades",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Camaras",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Deportes",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Libros",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ],
            ),
          ),
          Container(

            child: custom.ExpansionTile(
              // leading: CircleAvatar(
              //     backgroundColor: Colors.green.withOpacity(.13),
              //     child: Icon(
              //       Icons.card_giftcard,
              //       color: Colors.green,
              //     )),
              title: Text(
                    'MAS Aliados',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.5,
                    ),
                  ),
                
          
              children: <Widget>[]),),
                 Container(

            child: custom.ExpansionTile(
              // leading: CircleAvatar(
              //     backgroundColor: Colors.green.withOpacity(.13),
              //     child: Icon(
              //       Icons.card_giftcard,
              //       color: Colors.green,
              //     )),
              title: Text(
                    'Mi Cuenta',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.6,
                    ),
                  ),
                
          
              children: <Widget>[
                // ListTile(
                //   onTap: () {
                //     showDialog(context: context, builder: (buildcontext) => PaymentsScreen());
                   
                //   },
                //   leading: Icon(Icons.book),
                //   title: CustomText(
                //     text: "Historial de pagos"
                //   ),
                // )
                ListTile(
            leading: Icon(Icons.add_shopping_cart_sharp),
            title: Text(
              "Mis ordenes",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            onTap: () async {
              bool allowed = AuthentificationService().currentUserVerified;
              if (!allowed) {
                final reverify = await showConfirmationDialog(context,
                    "You haven't verified your email address. This action is only allowed for verified users.",
                    positiveResponse: "Resend verification email",
                    negativeResponse: "Go back");
                if (reverify) {
                  final future = AuthentificationService()
                      .sendVerificationEmailToCurrentUser();
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return FutureProgressDialog(
                        future,
                        message: Text("Resending verification email"),
                      );
                    },
                  );
                }
                return;
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyOrdersScreen(),
                ),
              );
            },
          ),

              ]),),

              custom.ExpansionTile(
      //leading: Icon(Icons.business),
      title: Text(
                    'Soy Vendedor',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.6,
                    ),
                  ),
      children: [
        ListTile(
          title: Text(
            "Agregar nuevo producto",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () async {
            bool allowed = AuthentificationService().currentUserVerified;
            if (!allowed) {
              final reverify = await showConfirmationDialog(context,
                  "You haven't verified your email address. This action is only allowed for verified users.",
                  positiveResponse: "Resend verification email",
                  negativeResponse: "Go back");
              if (reverify) {
                final future = AuthentificationService()
                    .sendVerificationEmailToCurrentUser();
                await showDialog(
                  context: context,
                  builder: (context) {
                    return FutureProgressDialog(
                      future,
                      message: Text("Resending verification email"),
                    );
                  },
                );
              }
              return;
            }
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProductScreen()));
          },
        ),
        ListTile(
          title: Text(
            "Gestionar mis productos",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          onTap: () async {
            bool allowed = AuthentificationService().currentUserVerified;
            if (!allowed) {
              final reverify = await showConfirmationDialog(context,
                  "You haven't verified your email address. This action is only allowed for verified users.",
                  positiveResponse: "Resend verification email",
                  negativeResponse: "Go back");
              if (reverify) {
                final future = AuthentificationService()
                    .sendVerificationEmailToCurrentUser();
                await showDialog(
                  context: context,
                  builder: (context) {
                    return FutureProgressDialog(
                      future,
                      message: Text("Resending verification email"),
                    );
                  },
                );
              }
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyProductsScreen(),
              ),
            );
          },
        ),
      ],
    ),
                 Container(

            child: custom.ExpansionTile(
              // leading: CircleAvatar(
              //     backgroundColor: Colors.green.withOpacity(.13),
              //     child: Icon(
              //       Icons.card_giftcard,
              //       color: Colors.green,
              //     )),
              title: AutoSizeText(
                    'Servicio Al Cliente',
                    
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 1,
                    ),
                  ),
                
          
              children: <Widget>[]),),

          Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 1.2,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onPressed: () {
                 showDialog(
                  context: context,
                  builder: (buildcontext) {
                    return CustomDialogo();
                  });    
              },
              child:
                  const Text('Cerrar Sesion', style: TextStyle(fontSize: 15)),
              color: kSecondaryColor,
              textColor: Colors.white,
              elevation: 7,
            ),
          ),
        ],
      ),
      // ),
    );
  }
}

  UserAccountsDrawerHeader buildUserAccountsHeader(User user) {
    return UserAccountsDrawerHeader(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: kTextColor.withOpacity(0.15),
      ),
      accountEmail: Text(
        user.email ?? "Sin Email",
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
      accountName: Text(
        user.displayName ?? "Sin Nombre",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      currentAccountPicture: FutureBuilder(
        future: UserDatabaseHelper().displayPictureForCurrentUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CircleAvatar(
              backgroundImage: NetworkImage(snapshot.data),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            final error = snapshot.error;
            Logger().w(error.toString());
          }
          return CircleAvatar(
            backgroundColor: kTextColor,
          );
        },
      ),
    );
  }
