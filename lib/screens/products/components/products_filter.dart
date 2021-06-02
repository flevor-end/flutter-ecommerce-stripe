import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/custom_expansion_tile.dart' as custom;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:masdamas/blocs/bloc_use.dart';
import 'package:masdamas/screens/profile/components/dialog.dart';
import 'package:masdamas/sizec.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Iniciom extends StatefulWidget {
  @override
  _IniciomState createState() => new _IniciomState();
}

class _IniciomState extends State<Iniciom> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(canvasColor: Colors.transparent),
        home: ProductFilter());
  }
}

class ProductFilter extends StatefulWidget {
  @override
  _ProductFilterState createState() => new _ProductFilterState();
}

class _ProductFilterState extends State<ProductFilter> {
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
      insetPadding: EdgeInsets.fromLTRB(120, 70, 0, 0),      
      child: dialogContent(context),
    );
  }
      
      
  dialogContent(BuildContext context) {
  return  new Container(
  height:Sizec.screenHeight,
  decoration: BoxDecoration(
    border: Border.all(color: kShopColor,width: 2),
    borderRadius:BorderRadius.circular(5),
    color: Colors.white,
  ),
    child:
      ListView(
       children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5)),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // IconButton(
                  //     icon: Icon(
                  //       Icons.arrow_back_ios,
                  //       color: kSecondaryColor,
                  //     ),
                  //     onPressed: (){Navigator.of(context).pop();}),
                 SizedBox(width: 5),
                  Text(
                    'CRITERIOS DE BUSQUEDA',
                    style: TextStyle(
                    color: kShopColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          

          Container(
            color: Colors.white,
            child: custom.ExpansionTile(
              title:   Text(
                    'Memoria',
                    style: TextStyle(
                      color: kSecondaryColor, 
                      fontSize:14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                
              
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    "ram",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  children: <Widget>[
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      //set border width

                      child: Text("8 gb"),
                    ),
                   
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: custom.ExpansionTile(
              
                  title: Text(
                    'Marca',
                    style: TextStyle(
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.9),
                  ),
                
              
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    "Xiaomi",
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
                    
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Samsung",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  children: <Widget>[
                    //ROPA
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text(""),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Apple",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Vivo",
                    style: TextStyle(color: kPrimaryColor),
                  ),
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
                    'Almacenamiento',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                
              
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    "256Gb",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  children: <Widget>[
                    Container(
                      //margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      // set border width
                      child: Text(""),
                    ),
                  ],
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
                    'Rango de precios',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                
          
              children: <Widget>[
                Container(),
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
                    'Filtrar por',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.5,
                    ),
                  ),
                
          
              children: <Widget>[]),),
                 Container(

            ),

          
        ],
      ),
      // ),
    );
  }
}
