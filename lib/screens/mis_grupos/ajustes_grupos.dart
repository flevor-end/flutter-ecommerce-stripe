


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/components/custom_bottom_navbar.dart';
import 'package:masdamas/screens/components/avatar.dart';
import 'package:masdamas/screens/home/components/home_header.dart';
import '../../constants.dart';
import '../../sizec.dart';



class AjusteG extends StatefulWidget {
  static String routeName = 'index_grupos';
  @override
  _AjusteGState createState() => _AjusteGState();
}

class  _AjusteGState extends State<AjusteG> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser;
  bool isSwitched = false; 

 




 @override

  @override
  Widget build(BuildContext context) {
  
    return  SafeArea(
        
        child: Scaffold(
               appBar: AppBar(
        iconTheme: IconThemeData(
          color: kSecondaryColor,
        ),
        flexibleSpace: HomeHeader(),
        leading: Container(),
      ),
                  body: SingleChildScrollView(
                  child: Column(
              children: [
                SizedBox(height: 15,),
          Padding(
              padding: const EdgeInsets.only(left:7,right:7),
              child: Container(
              height: 30,
              width: Sizec.screenWidth,
              decoration: BoxDecoration(
           
               border: Border.all(width: 2, color:kPrimaryColor),
              borderRadius: BorderRadius.circular(6),
              ),    
        child: Row(children: [
        IconButton(
        padding:EdgeInsets.all(1.0),
        alignment: Alignment.topCenter,
        icon:Icon(Icons.arrow_back_ios),color: kSecondaryColor,
        onPressed: (){ Navigator.pop(context);},
        iconSize: 23,
      ),
  Align(child: Text("AJUSTES GRUPOS",style:TextStyle(color:kSecondaryColor,fontSize: 15,fontWeight:FontWeight.w700 )),widthFactor:  Sizec.screenWidth/205),
],),),
),
 SizedBox(height: 40),
  Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Avatar(
                      tamano: 33,
                    ),
                    SizedBox(width: 12,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                               
                           Row(children:[

                           Text(" ",textAlign:TextAlign.left,style:TextStyle(fontSize: 17,color: kPrimaryColor,fontWeight:FontWeight.bold) ),  
                           Text(auth.currentUser.displayName,textAlign:TextAlign.left,style:TextStyle(fontSize: 16,color: kPrimaryColor,fontWeight:FontWeight.bold) ),
                      

                         ]),

                         SizedBox(height: 5,),
                          Align(
                            
                         child: Row(children:[
                           Icon(Icons.military_tech_outlined),
                           Text("Nivel Oro",style:TextStyle(fontSize: 14,color: kSecondaryColor,fontWeight:FontWeight.bold)),
                           ]),
                         ),
                            Align(
                            
                         child: Row(children:[
                           Text(" ",textAlign:TextAlign.left,style:TextStyle(fontSize: 17,color: kPrimaryColor,fontWeight:FontWeight.bold) ), 
                           Text("ESTAS EN N GRUPOS",style:TextStyle(fontSize: 12,color: Colors.grey,fontWeight:FontWeight.bold)),
                           ]),
                         ),
                         
                      

                        ],
                      ),
                  ],
                ),
             SizedBox(height: 30),           
        
             Container(
           padding: EdgeInsets.only(left: 4,right:2),
         
               decoration: BoxDecoration(
           
               border: Border.all(width: 2, color:kSecondaryColor),
              borderRadius: BorderRadius.circular(6),
              ),
           child: SizedBox(
      width: Sizec.screenWidth/1.8,
      height: getProportionateScreenHeight(45),
      child:   Row(
        mainAxisAlignment : MainAxisAlignment.center,
                children: <Widget>[
                 
                 
                  Text(
                    "NOTIFICACIONES",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:12,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 40,),
              Switch(  
              onChanged: null,  
              value: isSwitched,  
              activeColor: Colors.white,  
              activeTrackColor:kPrimaryColor,  
              inactiveThumbColor: Colors.white,  
              inactiveTrackColor: Colors.grey,  
            ) 
                ],
              ),
      ),
    ),
         
           SizedBox(height: 30),  
      Container(
           padding: EdgeInsets.only(left: 4,right:2),
         
               decoration: BoxDecoration(
           
               border: Border.all(width: 2, color:kSecondaryColor),
              borderRadius: BorderRadius.circular(6),
              ),
           child: SizedBox(
      width: Sizec.screenWidth/1.8,
      height: getProportionateScreenHeight(45),
      child:   Row(
         mainAxisAlignment : MainAxisAlignment.center,
                children: <Widget>[
                 
                 
                  Text(
                    "GRUPOS OCULTOS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:12,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   SizedBox(width: 30),
              Switch(  
              onChanged: null,  
              value: isSwitched,  
              activeColor: Colors.white,  
              activeTrackColor:kPrimaryColor,  
              inactiveThumbColor: Colors.white,  
              inactiveTrackColor: Colors.grey,  
            )
                ],
              ),
      ),
    ),
           SizedBox(height: 30,),  
       Container(
           padding: EdgeInsets.only(left: 4,right:2),
         
               decoration: BoxDecoration(
           
               border: Border.all(width: 2, color:kSecondaryColor),
              borderRadius: BorderRadius.circular(6),
              ),
           child: SizedBox(
      width: Sizec.screenWidth/1.8,
      height: getProportionateScreenHeight(45),
      child:   Row(
        mainAxisAlignment : MainAxisAlignment.center,
                children: <Widget>[
                 
                 
                  Text(
                    "BLOQUEAR DESCARGAS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:12,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
              Switch(  
              onChanged: null,  
              value: isSwitched,  
              activeColor: Colors.white,  
              activeTrackColor:kPrimaryColor,  
              inactiveThumbColor: Colors.white,  
              inactiveTrackColor: Colors.grey,  
            )

                ],
              ),
      ),
    ),
           SizedBox(height: 30),  
            Container(
           padding: EdgeInsets.only(left: 4,right:2),
         
               decoration: BoxDecoration(
           
               border: Border.all(width: 2, color:kSecondaryColor),
              borderRadius: BorderRadius.circular(6),
              ),
           child: SizedBox(
      width: Sizec.screenWidth/1.8,
      height: getProportionateScreenHeight(45),
      child:   Row(
         mainAxisAlignment : MainAxisAlignment.center,
                children: <Widget>[
                 
                 
                  Text(
                    "COPIA DE SEGURIDAD",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:12,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),  
              Switch(  
              onChanged: null,  
              value: isSwitched,  
              activeColor: Colors.white,  
              activeTrackColor:kPrimaryColor,  
              inactiveThumbColor: Colors.white,  
              inactiveTrackColor: Colors.grey,  
            )
                ],
              ),
      ),
    ),
          SizedBox(height: 30),  
      Container(
           padding: EdgeInsets.only(left: 4,right:2),
         
               decoration: BoxDecoration(
           
               border: Border.all(width: 2, color:kSecondaryColor),
              borderRadius: BorderRadius.circular(6),
              ),
           child: SizedBox(
      width: Sizec.screenWidth/1.8,
      height: getProportionateScreenHeight(45),
      child:   Row(
              mainAxisAlignment : MainAxisAlignment.center,
                children: <Widget>[ 
                  Text(
                    "RECIBIR NOTIFICACIONES",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:11,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              Switch(  
              onChanged: null,  
              value: isSwitched,  
              activeColor: Colors.white,  
              activeTrackColor:kPrimaryColor,  
              inactiveThumbColor: Colors.white,  
              inactiveTrackColor: Colors.grey,  
            )
                ],
              ),
      ),
    ),
                     
              ],
            ),
          ),
           bottomNavigationBar:CustomBottomNavBar(color: false,color2: true,color3: false,),
        ),
      );
    
  }
  
}

 class BtnGrupos extends StatelessWidget {
   const BtnGrupos({
     Key key,
    this.text,
    this.press,
    this.image,
    this.width,
    this.letra
   }) : super(key: key);

   final String text,image;
   final Function press;
   final double width,letra;

  @override
   Widget build(BuildContext context) {
     return  Container(
           padding: EdgeInsets.only(left: 4,right:2),
           child: SizedBox(
      width: Sizec.screenWidth/2.11,
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



class ItemG extends StatelessWidget {
  const ItemG({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         CircleAvatar(
                
                radius: 18.0,
                 backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/masdamas-49803.appspot.com/o/Captura%20de%20Pantalla%202021-05-21%20a%20la(s)%2010.50.40%20a.%C2%A0m..png?alt=media&token=56a051d8-e27f-4ef6-859b-3c42eddc7f3c"),
              ),
          Text(
            "Nombre de Grupo ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
              fontWeight: FontWeight.w600
            )
          ),
        ],
      
    );
  }
}