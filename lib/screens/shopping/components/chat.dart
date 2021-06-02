
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/components/custom_bottom_navbar.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/home/components/home_header.dart';
import 'package:masdamas/screens/shopping/components/chat_users.dart';
import '../../../sizec.dart';



class Chat extends StatefulWidget {

  static String routeName = 'chat_main';
  @override
  State createState() => ChatState();
}

class ChatState extends State<Chat> {
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      flexibleSpace: HomeHeader(),
      leading: Container(),
      ),
      body:  Column(
        children: [
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
      
       SizedBox(width: Sizec.screenWidth/9,),
       Text("CHAT MAS SHOPPING",style:TextStyle(color:Colors.white,fontSize: 18,fontWeight:FontWeight.w500 )),
            ],),),
            SizedBox(height: 15,),
            Row(children:[
              Container(
           padding: EdgeInsets.only(left: 10,right:7),
           child: SizedBox(
      width: Sizec.screenWidth/2.17,
      height: getProportionateScreenHeight(42),
      child: FlatButton(
        color: kSecondaryColor,
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
              side: BorderSide(width: 1.5, color: kSecondaryColor)),
        onPressed: (){},
        child:  Row(
                children: <Widget>[
                  Container(
                    height: 25,

                    child: SvgPicture.asset(
                    "assets/icons/blanco1shopping.svg",
                      width: 30,
                    ),
                  ),
                  SizedBox(width:15),
                  Text(
                    "CHATS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                     
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
      ),
    ),
  ),
             Container(
           padding: EdgeInsets.only(left: 1,right:1),
           child: SizedBox(
      width: Sizec.screenWidth/2.17,
      height: getProportionateScreenHeight(42),
      child: FlatButton(
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
              side: BorderSide(width: 1.5, color: kSecondaryColor)),
        onPressed: (){},
        child:  Row(
                children: <Widget>[
                  Container(
                    height: 27,
                    child:Icon(Icons.person_outline,color: kSecondaryColor,),
                  ),
                  SizedBox(width:15),
                  Text(
                    "CONTACTOS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                     
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
      ),
    ),
         ),
        
            ]),
             SizedBox(height:15),
            Row(
              mainAxisAlignment : MainAxisAlignment.spaceEvenly,
              
              children: [
    Item(),
    Item(),
    Item(),
    Item(),
    Item(),


            ],),
             SizedBox(height:8),
            Padding(
  padding: const EdgeInsets.only(left:15,right:15,top: 12, bottom: 12),
  child:   Container(
    height: 40,
    child: TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
          hintText: "Buscar Chat,Persona O Grupo ",
              hintStyle:TextStyle(fontSize: 12),
  
          border: OutlineInputBorder()
      )
    ),
  ),
),
 SizedBox(height:8),
      Row(children:[
              Container(
           padding: EdgeInsets.only(left: 10,right:7),
           child: SizedBox(
      width: Sizec.screenWidth/2.17,
      height: getProportionateScreenHeight(42),
      child: FlatButton(
        color: Colors.white10,
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
              side: BorderSide(width: 1.5, color: kPrimaryColor)),
        onPressed: (){},
        child:  Row(
                children: <Widget>[
                  Container(
                    height: 25,

                    child: SvgPicture.asset(
                    "assets/icons/rojo1shopping.svg",
                      width: 30,
                    ),
                  ),
                  SizedBox(width:8),
                  Text(
                    " NUEVO CHAT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                     
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
      ),
    ),
  ),
             Container(
           padding: EdgeInsets.only(left: 1,right:1),
           child: SizedBox(
      width: Sizec.screenWidth/2.17,
      height: getProportionateScreenHeight(42),
      child: FlatButton(
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
              side: BorderSide(width: 1.5, color: kPrimaryColor)),
        onPressed: (){},
        child:  Row(
                children: <Widget>[
                  Container(
                    height: 27,
                    child:SvgPicture.asset(
                    "assets/icons/rojo2shopping.svg",
                      width: 30,
                    ),
                  ),
                  SizedBox(width:15),
                  Text(
                    "AGREGAR",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                     
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
      ),
    ),
         ),
        
            ]),
             SizedBox(height:8),
            Expanded(child: Chatu()),


                // Loading
              
              ],
          
        
      ),

    bottomNavigationBar: CustomBottomNavBar(),
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
         CircleAvatar(
                
                radius: 18.0,
                 backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/masdamas-49803.appspot.com/o/Copia%20de%20usuario.png?alt=media&token=1f391c7c-97cb-44e8-910e-cad3fcb4a867"),
              ),
          Text(
            "Nombre",
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