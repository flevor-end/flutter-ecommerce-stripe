import 'package:flutter/material.dart';
import 'package:masdamas/sizec.dart';

import '../constants.dart';
import 'custom_bottom_navbar.dart';



class ShareScreen extends StatefulWidget {

  @override
   _ShareScreenState createState() => new  _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(

        body: Column(children: [
            SizedBox(height: 15,),
            Container(
            height: 33,
            width: Sizec.screenWidth,
            decoration: BoxDecoration(
              color: kSecondaryColor
            ),
              
        child: Row(children: [
        IconButton(
        padding:EdgeInsets.all(4.0),
        alignment: Alignment.topCenter,
        icon:Icon(Icons.arrow_back_ios),color: Colors.white,
        onPressed: (){ Navigator.pop(context);},
        iconSize: 25,
      ),
  Align(child: Text("COMPARTIR MAS",style:TextStyle(color:Colors.white,fontSize: 18,fontWeight:FontWeight.bold )),widthFactor:  Sizec.screenWidth/205),
],),),

SizedBox(height: 25,),
Container( 
  
  width: 200,
  height: 150,
  decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/images/logoapp.png'),
    fit:BoxFit.fill,  
   ),
  ),
  ),

  SizedBox(height: 30,),

           Container(
            height: 50,
            width: Sizec.screenWidth,
            decoration: BoxDecoration(
              color: kSecondaryColor
            ),
              
        child: Row(children: [
    
  Align(child: Text("COMPARTIR MASDAMAS\n       CON TUS AMIGOS",style:TextStyle(color:Colors.white,fontSize: 17,fontWeight:FontWeight.bold )),widthFactor: Sizec.screenWidth/213),


],),),

  Column(children: [
    SizedBox(height: 20,),
    Item3(text:"INSTAGRAM" ,image:"assets/images/instagramcon.png"),
    SizedBox(height: 20,),
    Item3(text:"WHATSAPP",image:"assets/images/whatsappcon.png" ,),
    SizedBox(height: 20,),
    Item3(text:"FACEBOOK MESSENGER",image:"assets/images/facebookcon.png",),
    SizedBox(height: 20,),
    Item3(text:"GOOGLE",image: "assets/images/googlecon.png",),
    SizedBox(height: 20,),
     ],
   )

        ],),
bottomNavigationBar: CustomBottomNavBar(color: false,color2: false,color3: false,),
      ),
    );
    
  }
}

class Item3 extends StatelessWidget {
const Item3({Key key ,this.image,this.text}) : super(key: key);
final String text,image;
  @override
  Widget build(BuildContext context) {
    return Row(
         mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
         SizedBox(width: 70,),
         CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 23.0,
                 backgroundImage: AssetImage(image),),

                    SizedBox(width: 30,),
           
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.bold
            )
          ),

   

        ],
      
    );
  }
}