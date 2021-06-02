


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/components/custom_bottom_navbar.dart';
import 'package:masdamas/screens/components/avatar.dart';
import 'package:masdamas/screens/home/components/home_header.dart';
import 'package:masdamas/screens/mis_grupos/ajustes_grupos.dart';
import 'package:masdamas/screens/mis_grupos/crear_grupo.dart';
import '../../constants.dart';
import '../../sizec.dart';
import 'mis_grupos.dart';



class IndexGrups extends StatefulWidget {
  static String routeName = 'index_grupos';
  @override
  _IndexGrupsState createState() => _IndexGrupsState();
}

class _IndexGrupsState extends State<IndexGrups> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser;

 
  List<Widget> grupos = [  
    ItemG(),
     ItemG(),
      ItemG(),
       ItemG(),
        ItemG(),
     ItemG(),
      ItemG(),
       ItemG(),
        ItemG(),
     ItemG(),
      ItemG(),
       ItemG(),
    

  ];  



 @override
  void initState() {
  super.initState();
  user= FirebaseAuth.instance.currentUser;
  imageCache.clear();
 
  }
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
                 Container(
                  height: 25,
                  width: Sizec.screenWidth/1.03,
                  decoration: BoxDecoration(

               border: Border.all(width: 2, color:kPrimaryColor),
                    
                     borderRadius: BorderRadius.all(
              Radius.circular(5) //                 <--- border radius here
      ) ),child:Align(child: Text("GRUPOS",style:TextStyle(color:kSecondaryColor,fontSize: 15,fontWeight:FontWeight.bold )),widthFactor: Sizec.screenWidth/130,),
      
),
 SizedBox(height: 12,),
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
             SizedBox(height: 10,),

             Row(
               mainAxisAlignment : MainAxisAlignment.center,
               children: [

            BtnGrupos(letra: 12,press: (){},text: "VER GRUPOS",image:"assets/icons/ver_grupos.svg",width: 10,),
            BtnGrupos(letra: 12,press: (){ Navigator.push(context,MaterialPageRoute(builder: (context) => Grups()));},text: "MIS GRUPOS",image:"assets/icons/mis_grupos.svg",width: 15,)
               
             ],),
                  SizedBox(height: 10,),
                      Row(
               mainAxisAlignment : MainAxisAlignment.center,
               children: [

            BtnGrupos(letra: 12,press: (){Navigator.push(context,MaterialPageRoute(builder: (context) => CrearGrups()));},text: "CREAR GRUPOS",image:"assets/icons/BOTON5.svg",),
            BtnGrupos(letra: 12,press: (){ Navigator.push(context,MaterialPageRoute(builder: (context) => AjusteG()));},text: "AJUSTES",image:"assets/icons/ajustes_icono.svg",width: 23,)
               
             ],),
             SizedBox(height: 10,),
                                           Container(
                  height: 25,
                  width: Sizec.screenWidth/1.03,
                  decoration: BoxDecoration( 
                        border: Border.all(width: 2, color:kPrimaryColor),
                        borderRadius: BorderRadius.all(
              Radius.circular(3) //                 <--- border radius here
      )),child:Align(child:Text("CATEGORIAS",style:TextStyle(color:kSecondaryColor,fontSize: 15,fontWeight:FontWeight.bold )),widthFactor: Sizec.screenWidth/130,),


      
      
),
  SizedBox(height: 10),
   GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 6.0,
          shrinkWrap: true,
          children: List.generate(12, (index) {
              return 
               
                
                
                  Column(
        
        children: <Widget>[
         CircleAvatar(
            radius: 37.5,
            backgroundColor: kPrimaryColor,

                    child: CircleAvatar(
                  foregroundColor: kPrimaryColor,
                  radius: 36.0,
                   backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/masdamas-49803.appspot.com/o/Captura%20de%20Pantalla%202021-05-21%20a%20la(s)%2010.50.40%20a.%C2%A0m..png?alt=media&token=56a051d8-e27f-4ef6-859b-3c42eddc7f3c"),
                ),
         ),
          Text(
            "Categoria",
            style: TextStyle(
              color: Colors.black,
              fontSize: 11.0,
              fontWeight: FontWeight.w600
            )
          ),
          
        ],
      
    );
                
              

          })),
          SizedBox(height: 20,),
 
                     
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