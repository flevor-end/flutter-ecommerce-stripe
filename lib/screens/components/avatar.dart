import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masdamas/components/page_transicion.dart';




class Avatar extends StatefulWidget {



   const Avatar({
    Key key,
    this.tamano

  }) : super(key: key);

  final double tamano;
  @override
  _AvatarEstate createState() => new _AvatarEstate();
  
}

class _AvatarEstate extends State<Avatar> {

 Stream<User>streamFire = FirebaseAuth.instance.authStateChanges();
  User user = FirebaseAuth.instance.currentUser;
 Stream<User> get authSta => streamFire;
 String photoUrl;
  @override
  void initState() {
  super.initState();

 
  }
  
 @override
  Widget build(BuildContext context) {
    
  
    return celador();
  }

  Widget celador() {
    return StreamBuilder(
       stream: authSta,
      builder: (BuildContext context, AsyncSnapshot snapshot) {   
        if (snapshot.hasData) {
          return CircleAvatar(
          radius: widget.tamano,
          backgroundImage: NetworkImage(user?.photoURL),
          );
        } else if (snapshot.hasError) {
          return Text("Ocurrio un error en la transmision de datos");
        } else if (snapshot.connectionState != ConnectionState.waiting) {
          return  CircleAvatar(
                backgroundColor: Colors.white12,
                radius: widget.tamano,
                 backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/masdamas-49803.appspot.com/o/Copia%20de%20usuario.png?alt=media&token=1f391c7c-97cb-44e8-910e-cad3fcb4a867"),
              );
        } else if (snapshot.hasData){
          return CircleAvatar(
                backgroundColor: Colors.white12,
                radius: widget.tamano,
                 backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/masdamas-49803.appspot.com/o/Copia%20de%20usuario.png?alt=media&token=1f391c7c-97cb-44e8-910e-cad3fcb4a867"),
              );
        } else  {
          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  height: 20,
                  width: 70,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.cyan[400],
                  )),
               Container(
                margin: EdgeInsets.only(top: 10),
                child: Text("C a r g a n d o",
                style: TextStyle(
                color: Colors.blue[400],
                fontSize: 22,
                fontFamily: "Lato",
                 decoration: TextDecoration.none)),
              )
            ]),
          );
          
        }
          
      },
    );
  }

}
