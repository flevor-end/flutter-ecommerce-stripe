import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masdamas/blocs/bloc_use.dart';
import 'package:masdamas/screens/sign_in/login.dart';


class InicialE extends StatefulWidget {
  

   const InicialE({
    Key key,
    this.destino,

  }) : super(key: key);

  final Widget destino;
  @override
  _InicialEstate createState() => new _InicialEstate();
}

class _InicialEstate extends State<InicialE> {
  
  Stream<User> streamFire = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authSta => streamFire;
  bool activate;
  User user = FirebaseAuth.instance.currentUser;
  UserBloc userBloc;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    
  
    return celador();
  }

  Widget celador() {
    return StreamBuilder(
      stream: authSta,
      builder: (BuildContext context, AsyncSnapshot snapshot) {   
        if (snapshot.hasData ) {
          return  widget.destino;
        } else if (snapshot.hasError) {
          return Text("Ocurrio un error en la transmision de datos");
        } else if (snapshot.connectionState != ConnectionState.waiting) {
          return Login();
        } else if (!snapshot.hasData){
          return Login();
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

                                    
     void login()  {

        // simulate the login 
        Future.delayed(Duration(seconds: 2)).then((_){

          setState(() {
           
          });
       

       

        });
      }
    }

