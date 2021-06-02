
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/components/custom_bottom_navbar.dart';
import 'package:masdamas/screens/home/components/home_header.dart';


import '../../constants.dart';
import '../../sizec.dart';
import 'detalles_pedidos.dart';


class CompraUnidos extends StatefulWidget {
  CompraUnidos({Key key}) : super(key: key);

  @override
  _CompraUnidosState createState() => _CompraUnidosState();
}

class _CompraUnidosState extends State<CompraUnidos> {
 final CollectionReference _productsRef =
  FirebaseFirestore.instance.collection("products");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kSecondaryColor,
        ),
        flexibleSpace: HomeHeader(),
        leading: Container(),
      ),
      body:
     Column(children: [
           SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left:7,right:7),
              child: Container(
              height: 35,
              width: Sizec.screenWidth,
              decoration: BoxDecoration(
           
               border: Border.all(width: 2, color:kPrimaryColor),
              borderRadius: BorderRadius.circular(6),
              ),    
        child: Row(children: [
        IconButton(
        padding:EdgeInsets.all(4.0),
        alignment: Alignment.topCenter,
        icon:Icon(Icons.arrow_back_ios),color: kSecondaryColor,
        onPressed: (){ Navigator.pop(context);},
        iconSize: 23,
      ),
  Align(child: Text("COMPRA UNIDOS MAS SHOPPING",style:TextStyle(color:kSecondaryColor,fontSize: 17,fontWeight:FontWeight.w600 )),widthFactor:  Sizec.screenWidth/380),
],),),
),
SizedBox(height: 8),
Expanded(
  child:   Container(
        child: Stack(children: [
          FutureBuilder<QuerySnapshot>(
            future: _productsRef.get(),
            builder: (context, snapshot){
              if(snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      "Error: ${snapshot.error}"
                    ),
                  ),
                );
              }
              //collection Data ready to display
              if(snapshot.connectionState == ConnectionState.done) {
                return ListView(
                  children: snapshot.data.docs.map((document) {
                    return 
                    ProductCard(
                      title: document.data()['title'],
                      imageUrl: document.data()['images'][0],
                      price: "\$${document.data()['price']}",
                      productId: document.id,
                    );
                  }).toList(),
                );
              }
              //Loading State
              return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
            }
            )
        ],),
      ),
),
     ],),
      
    bottomNavigationBar:CustomBottomNavBar(color: false,color2: false,color3: false,),
         
         
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
    final String productId;
    final Function onPressed;
    final String imageUrl;
    final String title;
    final String price;
   ProductCard({this.onPressed, this.title, this.imageUrl, this.price, this.productId});



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      height: 130,
        margin: EdgeInsets.all(7),
        decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.orange[800]),
             borderRadius: BorderRadius.circular(6),
            ),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.28,
              
              child: AspectRatio(
                  aspectRatio: 0.98,
                  child: Padding(
                    padding: const EdgeInsets.only(top:8.0, left: 10.0, bottom: 8.0),
                    child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: kSecondaryColor,),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Image.network(
                      "$imageUrl" 
                    )
                ),
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Container(
                width: size.width * 0.652,
                height: 124,
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment : MainAxisAlignment.center,
                      children: [
                         SizedBox(width: 8,),
                      Text(
                        "17:44:12",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),),
                      SizedBox(width: 50,),
                      Row(children: [
                      Item(),
                      SizedBox(width: 5,),
                      Item(),
                      SizedBox(width:5,),
                      Item(),
                      ],),
                    ],),
                    SizedBox(height:10,),
                      Row(
                      mainAxisAlignment : MainAxisAlignment.center,
                      children: [

                          Container(
           padding: EdgeInsets.only(left: 8,right:1),
           child: SizedBox(
      width: Sizec.screenWidth/3.5,
      height: 30,
      child: FlatButton(
        color: kSecondaryColor,
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
        ),
        onPressed: (){ Navigator.push( context, MaterialPageRoute(builder: (context) => DetallesP()));},
        child:  Row(
          mainAxisAlignment : MainAxisAlignment.center,
                children: <Widget>[
                
                  Text(
                    "VER DETALLES",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
      ),
    ),
         ),
                        SizedBox(width: 10,),
     Container(
     padding: EdgeInsets.only(left: 1,right:1),
           child: SizedBox(
      width: Sizec.screenWidth/3.3,
      height: 30,
      child: FlatButton(
        color:kPrimaryColor,
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
              side: BorderSide(width: 1.5, color: kPrimaryColor)),
        onPressed: (){},
        child:  Row(
          mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 18,

                    child: SvgPicture.asset("assets/icons/icono_compartir_shopping.svg",
                    width: 18,
                    ),
                  ),
                  SizedBox(width: 1.6,),
                  Text(
                    "COMPARTIR",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
      ),
    ),
         ),



                    ],),
               
               
                    
                  ],
                )
              ),
            ),
          ],
        ),
      
    );
  }
}

class Item extends StatelessWidget {
  const Item({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(),
         CircleAvatar(
                
                radius: 12.0,
                 backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/masdamas-49803.appspot.com/o/Copia%20de%20usuario.png?alt=media&token=1f391c7c-97cb-44e8-910e-cad3fcb4a867"),
              ),
       
        ],
      
    );
  }
}