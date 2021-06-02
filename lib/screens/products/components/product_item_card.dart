import 'package:flutter/material.dart';
import 'package:masdamas/screens/details/details_screen.dart';

import '../../../constants.dart';


class ProductItemCard extends StatelessWidget {
    final String productId;
    final Function onPressed;
    final String imageUrl;
    final String title;
    final String price;
    ProductItemCard({this.onPressed, this.title, this.imageUrl, this.price, this.productId});



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(productId: productId,)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
              border: Border.all(width: 1, color: kSecondaryColor)
            ),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.33,
              
              child: AspectRatio(
                  aspectRatio: 0.98,
                  child: Padding(
                    padding: const EdgeInsets.only(top:10.0, left: 10.0, bottom: 10.0),
                    child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: kSecondaryColor,)
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
                
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: kSecondaryColor))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 8,bottom: 5.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                        ),                                  ),
                    ),
                    ContentCardProduct(
                      text: 'USUARIOS',
                      description: 'ENTREGA 15 DIAS', 
                      
                    ),
                    ContentCardProduct(
                      text: 'PRECIO UNIDOS',
                      description: price,
                    ),
                    ContentCardProduct(
                      text: 'GANA',
                      description: "50 MASBIT",
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContentCardProduct extends StatelessWidget {
  final String text, description;
  final double size;
  final bool isFullsize;
  


  const ContentCardProduct({
    Key key, this.text, this.description, this.size = 8, this.isFullsize = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1, color: kSecondaryColor))
      ),
      child: Row(
          
          
          children: [
            Container(
              width: size.width * 0.33,
              child: Text(

                text,
                textAlign: TextAlign.center,
                
              )
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              width: size.width * 0.3,
              decoration: BoxDecoration(border: Border(left: BorderSide(width: 1, color: kSecondaryColor))),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
                
              )
            )
          ],
        ),
      
    );
  }
}