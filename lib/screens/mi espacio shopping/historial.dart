import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:masdamas/screens/home/components/home_header.dart';
import 'package:masdamas/screens/mi%20espacio%20shopping/banner_shopping.dart';


import '../../constants.dart';
import '../../sizec.dart';


class Historial extends StatefulWidget {
   Historial({Key key}) : super(key: key);

  @override
  _HistorialState createState() => _HistorialState();
}

class _HistorialState extends State< Historial> {
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
      SizedBox(width:90),
 Text("HISTORIAL",style:TextStyle(color:kSecondaryColor,fontSize: 17,fontWeight:FontWeight.w600 ))
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
      
    bottomNavigationBar:BannerSho(),
         
         
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
                    Container(
                      padding: EdgeInsets.only(left: 8,bottom: 5.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                    Row(
                      mainAxisAlignment : MainAxisAlignment.center,
                      children: [
                      SizedBox(width: 10,),
                      Text(
                        "Breve descripcion\nBreve descripcion",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color:Colors.grey[400],
                        ),),
                        SizedBox(width: 17,),
                        
   Container(
           padding: EdgeInsets.only(left: 4,right:1),
           child: SizedBox(
      width: Sizec.screenWidth/3.5,
      height: 30,
      child: FlatButton(
        
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
             side: BorderSide(
            color: kSecondaryColor,
            width: 1.5,
            style: BorderStyle.solid
          )
        ),
        onPressed: (){},
        child:  Row(
          mainAxisAlignment : MainAxisAlignment.center,
                children: <Widget>[
                
                  Text(
                    "RECORDATORIO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 9.2,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
      ),
    ),
         ),
                      Row(children: [
                      
                      ],),
                    ],),
                    SizedBox(height: 10,),
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
        onPressed: (){},
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
                        SizedBox(width: 8,),
                          Container(
           padding: EdgeInsets.only(left: 8,right:1),
           child: SizedBox(
      width: Sizec.screenWidth/3.5,
      height: 30,
      child: FlatButton(
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
        ),
        onPressed: (){},
        child:  Row(
          mainAxisAlignment : MainAxisAlignment.center,
                children: <Widget>[
                
                  Text(
                    "SEGUIMIENTO",
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


