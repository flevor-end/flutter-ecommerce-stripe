import 'dart:io';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:masdamas/blocs/bloc_use.dart';
import 'package:masdamas/blocs/user_controller.dart';
import 'package:masdamas/components/page_transicion.dart';
import 'package:masdamas/locator.dart';
import 'package:masdamas/screens/complete_profile/complete_profile_screen.dart';
import 'package:masdamas/screens/manage_addresses/manage_addresses_screen.dart';
import 'package:masdamas/screens/mi%20espacio%20shopping/compra_unidos.dart';
import 'package:masdamas/screens/mi%20espacio%20shopping/devoluciones_index.dart';
import 'package:masdamas/screens/mi%20espacio%20shopping/en_camino.dart';
import 'package:masdamas/screens/mi%20espacio%20shopping/historial.dart';
import 'package:masdamas/screens/mi%20espacio%20shopping/mis_pedidos.dart';
import 'package:masdamas/screens/mi%20espacio%20shopping/por_despachar.dart';
import 'package:masdamas/screens/my_orders/my_orders_screen.dart';
import 'package:masdamas/screens/profile/profile_screen.dart';
import 'package:simple_image_crop/simple_image_crop.dart';
import 'package:masdamas/models/user.dart' as model;
import '../../../constants.dart';
import '../../../sizec.dart';
import 'avatar_perfil.dart';



class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser;
   File _image;
  final picker = ImagePicker();
 


  
  Future getImage() async {
     final PickedFile image = await picker.getImage(
      source: ImageSource.gallery);
      _image = File(image?.path);

    if (_image == null) {return  Navigator.of(context).pop();}
   
    Navigator.of(context).pushNamed(SimpleCropRoute.routeName, arguments: {'image': _image});
  }
  
 @override
  void initState() {
  super.initState();
  user= FirebaseAuth.instance.currentUser;
  imageCache.clear();
 
  }
  @override
  Widget build(BuildContext context) {
  
    return GestureDetector(
           onTap: () {
            Scaffold.of(context).hideCurrentSnackBar();
              },
            
          child: SafeArea(
        
        child: SingleChildScrollView(
                child: Column(
            children: [
              SizedBox(height: 20,),
               Container(
                height: 25,
                width: Sizec.screenWidth/1.03,
                decoration: BoxDecoration( borderRadius: BorderRadius.all(
            Radius.circular(3) //                 <--- border radius here
      ),color: kPrimaryColor ),child:Align(child: Text("MI ESPACIO",style:TextStyle(color:Colors.white,fontSize: 15,fontWeight:FontWeight.bold )),widthFactor: Sizec.screenWidth/130,),
      
),
 SizedBox(height: 12,),
              Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // AvatarP(
                  //   tamano: 33,
                  // ),
                  SizedBox(width: 12,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                             
                         Row(children:[

                         Text(" ",textAlign:TextAlign.left,style:TextStyle(fontSize: 17,color: kPrimaryColor,fontWeight:FontWeight.bold) ),  
                         //Text(auth.currentUser.displayName,textAlign:TextAlign.left,style:TextStyle(fontSize: 16,color: kPrimaryColor,fontWeight:FontWeight.bold) ),
                    

                       ]),

                       SizedBox(height: 5,),
                        Align(
                          
                       child: Row(children:[
                         Icon(Icons.military_tech_outlined),
                         Text("Nivel Oro",style:TextStyle(fontSize: 14,color: kSecondaryColor,fontWeight:FontWeight.bold)),
                         ]),
                       ),
                        Row(children:[
                        Icon(Icons.create),
                        GestureDetector( onTap: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 10),
                        backgroundColor: Colors.grey[100],
                        content: Container(                       
                          height: 82,
                          child: Column(
                          children: [
                            Text('Cambiar Foto de Perfil',style: TextStyle(color: kSecondaryColor,fontWeight:FontWeight.bold),),
                             SizedBox(height:3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center, 
                              children:[
                             Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center, 
                               children: [
                               IconButton(icon: Icon(Icons.delete_forever,color: kPrimaryColor,size:33), onPressed:(){
                                
         String downloadUrl ="https://firebasestorage.googleapis.com/v0/b/masdamas-49803.appspot.com/o/Copia%20de%20usuario.png?alt=media&token=1f391c7c-97cb-44e8-910e-cad3fcb4a867";
         locator.get<UserController>().updatePhotoUrl(downloadUrl);
         Fluttertoast.showToast(
         msg: "Haz Actualizado tu foto de perfil",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: kPrimaryColor,
        textColor: Colors.white,fontSize: 20);
        Navigator.of(context).pushNamedAndRemoveUntil(
        Transicion.routeName, (Route<dynamic> route) => false);

                               } ),
                               Text('Eliminar',style: TextStyle(color: kSecondaryColor,fontWeight:FontWeight.bold,fontSize: 12),),

                             ],),
                             
                             SizedBox(width:35),
                            
                             Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,   
                            children: [
                            IconButton(icon: Icon(Icons.photo_album,color: kSecondaryColor,size: 33), onPressed: ()async{getImage();} ),
                            Text('Galeria',style: TextStyle(color: kSecondaryColor,fontWeight:FontWeight.bold,fontSize: 12),),
                                
                             ],)

                            ])
                          ],
                        )),
                       
                      ));
                        },child: Text("Editar Foto de Perfil",style:TextStyle(fontSize: 13,color: kSecondaryColor,fontWeight:FontWeight.w400,decoration: TextDecoration.underline))),
                       ]),

                      ],
                    ),
                ],
              ),
           SizedBox(height: 10,),
                                         Container(
                height: 25,
                width: Sizec.screenWidth/1.03,
                decoration: BoxDecoration( borderRadius: BorderRadius.all(
            Radius.circular(3) //                 <--- border radius here
      ),color: kSecondaryColor ),child:Align(child: Text("MI CUENTA",style:TextStyle(color:Colors.white,fontSize: 15,fontWeight:FontWeight.bold )),widthFactor: Sizec.screenWidth/130,),


      
      
),
  SizedBox(height: 20),
                   Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children:[

                         BotonSoporte (shoppingCardNum: "DATOS PERSONALES",press: (){
                           Navigator.of(context).pushNamed(CompleteProfileScreen.routeName);
                         },),
                         SizedBox(width: 10),
                         BotonSoporte (shoppingCardNum: "DIRECCIONES",
                         press: () {
                           Navigator.push(context,MaterialPageRoute(builder: (context) => ManageAddressesScreen()));
                         },
                         ),
  
                         ]

                       ),
                         SizedBox(height: 20),
                          Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children:[

                         BotonSoporte (shoppingCardNum: "SEGURIDAD",),
                         SizedBox(width: 10),
                         BotonSoporte (shoppingCardNum: "BILLETERA",),
  
                         ]

                       ),
                       SizedBox(height: 20),
                        Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children:[

                         BotonSoporte (shoppingCardNum: "",),
                         SizedBox(width: 10),
                         BotonSoporte (shoppingCardNum: "AJUSTES",),
  
                         ]

                       ),
                     ],
                   ),
       SizedBox(height: 22,),
                                         Container(
                height: 25,
                width: Sizec.screenWidth/1.03,
                decoration: BoxDecoration( borderRadius: BorderRadius.all(
            Radius.circular(3) //                 <--- border radius here
      ),color: kSecondaryColor ),child:Align(child: Text("SHOPPING",style:TextStyle(color:Colors.white,fontSize: 15,fontWeight:FontWeight.bold )),widthFactor: Sizec.screenWidth/130,),

),

      SizedBox(height: 20),
                   Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children:[

                         BotonSoporte (shoppingCardNum: "COMPRA UNIDOS",press: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context) => CompraUnidos()));
                         

                         },),
                         SizedBox(width: 10),
                         BotonSoporte (shoppingCardNum: "MIS PEDIDOS",press: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context) => MyOrdersScreen()));
                         

                         },),
  
                         ]

                       ),
                         SizedBox(height: 20),
                          Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children:[

                         BotonSoporte (shoppingCardNum: "EN CAMINO",press: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context) => EnCamino()));
                         

                         },),
                         SizedBox(width: 10),
                         BotonSoporte (shoppingCardNum: "POR DESPACHAR",press: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context) => PorDespachar()));
                         

                         },),
  
                         ]

                       ),
                       SizedBox(height: 20),
                        Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children:[

                         BotonSoporte (shoppingCardNum: "HISTORIAL",press: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context) => Historial()));
                         

                         },),
                         SizedBox(width: 10),
                         BotonSoporte (shoppingCardNum: "DEVOLUCIONES",press: (){
                           Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Devoluciones()));
                         },),
                      
  
                         ]

                       ),
                          SizedBox(height: 20),
                     ],
                   ),
            ],
          ),
        ),
      ),
    );
  }
  
}
class BotonSoporte extends StatelessWidget {

  final String shoppingCardNum;
  final bool isDone;
  final Function press;
  const BotonSoporte({
    Key key,
    this.shoppingCardNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraint) {
      return GestureDetector(
        onTap: press,
        child: Container(
                 width: size.width * 0.47,
                 height: 40,
          decoration: BoxDecoration(
              
              border: Border.all(
                color: kSecondaryColor,
      width: 1.8, 
    ),
              borderRadius: BorderRadius.circular(4),
              
              
          ),
         
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "$shoppingCardNum",
                      style: TextStyle(
                          fontSize: 13,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
          ),
      );
      
    });
  }
}

class SimpleCropRoute extends StatefulWidget {
   static String routeName = 'crop';
  
  @override
  _SimpleCropRouteState createState() => _SimpleCropRouteState();
}
class _SimpleCropRouteState extends State<SimpleCropRoute> {
  final cropKey = GlobalKey<ImgCropState>();
  model.User _currentUser = locator.get<UserController>().currentUser;
  UserBloc userBloc;
  User user = FirebaseAuth.instance.currentUser;
 final FirebaseFirestore _db = FirebaseFirestore.instance;

 
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
      userBloc = BlocProvider.of(context);
    return Scaffold(
        
        body: Container(
          child: Center(
            child: ImgCrop(
              key: cropKey,
              maximumScale: 3,
              image: FileImage(args['image']),
            ),
          ),
        ),
       
     bottomNavigationBar:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         SizedBox(width: 10,),
         RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  onPressed: () async{
                     
          final crop = cropKey.currentState;
          final croppedFile =
          await crop.cropCompleted(args['image'], pictureQuality:400);
          await locator.get<UserController>().uploadProfilePicture(croppedFile);
         var imageUrl = await locator<UserController>().getDownloadUrl();
          String downloadUrl = imageUrl.toString();
        locator.get<UserController>().updatePhotoUrl(downloadUrl);
         DocumentReference ref = _db.collection("users").doc(user.uid);
    ref.set({
    'photoUrl':downloadUrl,
    }, SetOptions(merge: true));
      
         Fluttertoast.showToast(
         msg: "Haz Actualizado tu foto de perfil",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: kPrimaryColor,
        textColor: Colors.white,fontSize: 20);
         Navigator.of(context).pushNamedAndRemoveUntil(Transicion.routeName, (Route<dynamic> route) => false);
                  },
                  child:
                      const Text('Aceptar', style: TextStyle(fontSize: 15)),
                  color: kSecondaryColor,
                  textColor: Colors.white,
                  elevation: 7,
                ),
                  RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  onPressed: () async{
                     
        Navigator.of(context).pushNamedAndRemoveUntil(
        ProfileScreen.routeName, (Route<dynamic> route) => false);
                  },
                  child:
                      const Text('Cancelar', style: TextStyle(fontSize: 15)),
                  color: kSecondaryColor,
                  textColor: Colors.white,
                  elevation: 7,
                ),
                SizedBox(width: 10,),
       ],
     )
     );
  }
}
