import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:masdamas/blocs/bloc_use.dart';
import 'package:masdamas/blocs/user_controller.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/sign_up/codigo_sms.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:masdamas/models/user.dart' as Model ;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../locator.dart';


class Registro extends StatefulWidget {
  static String routeName = 'registro';
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  
  bool _isBiometricAvailable = false;
  final storage = FlutterSecureStorage();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _ocultar1 = true;
  bool _ocultar = true;
  bool showProgress = false;
  String emai,contrase,nam,numt,numd,tipoi;
  TextEditingController contrasena = TextEditingController();
  TextEditingController confirmcontrasena = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
   UserBloc userBloc;
   String valor;
 
    
  @override
  void initState() {
    super.initState();
    getSecureStorage();
  }
  

  @override
  Widget build(BuildContext context) {
     userBloc = BlocProvider.of(context);
  
    final nombre = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: TextFormField(
         onChanged: (value) {
          nam = value; //get the value entered by user.
        },
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Por favor ingrese su nombre';
          }
          return null;
        },
        decoration: InputDecoration(
      
      enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: kSecondaryColor,
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:kSecondaryColor,
        width: 1.5,
      ),
    ),
    errorBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:kPrimaryColor,
        width: 1.5,
      ),
    ), 
          hintText: 'Nombre',
          hintStyle: TextStyle(fontSize: 14),
          prefixIcon: Icon(Icons.perm_identity, color: kPrimaryColor),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
          
          ),
        ),
        textCapitalization: TextCapitalization.sentences,
      ),
    );

    final email = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: TextFormField(
        onChanged: (value) {
          emai = value; //get the value entered by user.
        },
        validator: (String value) {
          if (value.isEmpty) {
            return 'Por favor ingrese su correo';
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return 'Por favor ingrese un correo valido';
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: kSecondaryColor,
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:kSecondaryColor,
        width: 1.5,
      ),
    ),
    errorBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:kPrimaryColor,
        width: 1.5,
      ),
    ), 
          hintText: 'Correo',
          hintStyle: TextStyle(fontSize: 14),
          prefixIcon: Icon(Icons.mail, color: kPrimaryColor),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
         
        ),
        autocorrect: false,
      ),
    );
   
    final documento = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: TextFormField(
        onChanged: (value) {
          numd = value; //get the value entered by user.
           _db.collection('users').where("document",isEqualTo:value).get().then((value) => value.docs.forEach((doc){
           valor = (doc["document"]).toString();
        }) );
        },
        validator: (String value) {
          if (value.isEmpty) {
            return 'Por favor ingrese su numero de documento';
          }
       
         print(valor);
         if (value == valor) {
            return 'Numero de Documento en Uso';
          }
 
          return null;
        },
        keyboardType: TextInputType.number,
        autofocus: false,
        decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: kSecondaryColor,
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:kSecondaryColor,
        width: 1.5,
      ),
    ),
    errorBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:kPrimaryColor,
        width: 1.5,
      ),
    ), 
          hintText: 'Numero De Documento',
          hintStyle: TextStyle(fontSize: 14),
          prefixIcon: Icon(Icons.picture_in_picture, color: kPrimaryColor),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        ),
        autocorrect: false,
      ),
    );
    final telefono = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: TextFormField(
        onChanged: (value) {
          numt = value; //get the value entered by user.
        },
        validator: (String value) {
          if (value.isEmpty) {
            return 'Por favor ingrese su numero de Telefono';
          }
          
          return null;
        },
      keyboardType: TextInputType.number,
      autofocus: false,
      decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: kSecondaryColor,
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:kSecondaryColor,
        width: 1.5,
      ),
    ),
    errorBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:kPrimaryColor,
        width: 1.5,
      ),
    ), 
          hintText: 'Numero De Telefono',
          hintStyle: TextStyle(fontSize: 14),
          prefixIcon: Icon(Icons.phone_iphone, color: kPrimaryColor),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        autocorrect: false,
      ),
    );
          final tipod = Padding(
           padding: EdgeInsets.symmetric(vertical: 1),
           child: Center(
             child: Container(
               height: 50,
               child:
     
              DropdownButtonFormField<String>(
         
                            items: [
                            DropdownMenuItem<String>(
                               value: "Cedula Ciudadania",
                                   child: Text(
                                    "Cedula Ciudadania",
                                 ),
                            ),
                                 DropdownMenuItem<String>(
                               value: "Pasaporte",
                                   child: Text(
                                    "Pasaporte",
                                 ),
                            ),
                            DropdownMenuItem<String>(
                                value: "Cedula De Extranjeria",
                                  child: Text(
                                    "Cedula De Extranjeria",
                                     ),
                            ),
                                  ],
                               onChanged: (value) async {
                                setState(() {
                                tipoi= value;
                                  });
                                            },
                     value: tipoi,
                     validator: (value) => value == null
                    ? 'Escoja Su Tipo De Documento' : null,
                     decoration: InputDecoration(
                         enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: kSecondaryColor,
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:kSecondaryColor,
        width: 1.5,
      ),
    ),
    errorBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:kPrimaryColor,
        width: 1.5,
      ),
    ), 
         contentPadding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
         hintText: 'Tipo De Documento',
          hintStyle: TextStyle(fontSize: 14),
                                      ),
                          
                          style: TextStyle(
                           color: kSecondaryColor, fontSize: 14),
                         
                          iconSize: 35.0,
                          iconEnabledColor:kPrimaryColor,
                       ),
                   ),
          ),
        );
      
    
    

    final password = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: TextFormField(
        onChanged: (value) {
          contrase = value; //get the value entered by user.
        },
        controller: contrasena,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Por favor ingrese una contraseña';
          } else if (value.length < 6) {
            return "Contraseña minimo 6 caracteres";
          }
          return null;
        },
        autofocus: false,
        obscureText: _ocultar,
        decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: kSecondaryColor,
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:kSecondaryColor,
        width: 1.5,
      ),
    ),
    errorBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:kPrimaryColor,
        width: 1.5,
      ),
    ), 
          hintText: 'Contraseña',
          hintStyle: TextStyle(fontSize: 14),
          prefixIcon: Icon(Icons.lock, color: kPrimaryColor),
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility, color: kPrimaryColor),
            onPressed: () {
              setState(() {
                _ocultar = !_ocultar;
              });
            },
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );

    final postPassword = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: TextFormField(
        controller: confirmcontrasena,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Por favor ingrese  la contraseña';
          }
        
          if (contrasena.text != confirmcontrasena.text) {
            return "Contraseñas no coinciden";
          }
          return null;
        },
        autofocus: false,
        obscureText: _ocultar1,
        decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: kSecondaryColor,
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:kSecondaryColor,
        width: 1.5,
      ),
    ),
    errorBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:kPrimaryColor,
        width: 1.5,
      ),
    ), 
          hintText: 'Confirme Contraseña',
          hintStyle: TextStyle(fontSize: 14),
          prefixIcon: Icon(Icons.lock, color: kPrimaryColor),
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility, color: kPrimaryColor),
            onPressed: () {
              setState(() {
                _ocultar1 = !_ocultar1;
              });
            },
          ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );

  
    final acepto2 = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: CheckboxListTile(
        activeColor: kPrimaryColor,
        title: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 1.0),
      child: Text(
        'Acepto Terminos,Condiciones De Uso Y Politicas de Privacidad De MASDAMAS',
         textAlign:TextAlign.start,
        style: TextStyle(
            color: kSecondaryColor,
            decoration: TextDecoration.underline,
            fontSize: 14),
      ),
      onPressed: () {},
    ),// The named parameter 'title' isn't defined.
        value: true,
        onChanged: (newValue) {},
        controlAffinity:
            ListTileControlAffinity.leading, //  <-- leading Checkbox
      ),
    );


    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0, horizontal:80),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () async {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus.unfocus();
          }
          setState(() {
            showProgress = true;
          });
          if (_formkey.currentState.validate()) {
            try {
             await _auth.createUserWithEmailAndPassword(
             email: emai, password: contrase);
             
             if(!_isBiometricAvailable){
                 storage.write(key: "email",value: emai);
                 storage.write(key: "pass",value:contrase);
                }  
           
             locator<UserController>().updateDisplayName(nam);
                                       
         String downloadUrl ="https://firebasestorage.googleapis.com/v0/b/masdamas-49803.appspot.com/o/Copia%20de%20usuario.png?alt=media&token=1f391c7c-97cb-44e8-910e-cad3fcb4a867";
         locator.get<UserController>().updatePhotoUrl(downloadUrl);
             if (_auth.currentUser!= null) {
             userBloc.updateUserData(Model.User(
             _auth.currentUser.uid,
             name: nam,
             document:numd,
             documenttype:tipoi,
                      ));            
                setState(() {
                  showProgress = false;
                });
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Codigosms(numero: "+57$numt",)),);
              }
            } catch (e) {
              if (e.code =='email-already-in-use') {
                Fluttertoast.showToast(
                    msg: "El Correo Ya Esta en Uso \n          Ingrese correo",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: kPrimaryColor,
                    textColor: Colors.white,
                    fontSize: 20.0);
                setState(() {
                  showProgress = false; 
                });
              }
          
            }
          } else {
            setState(() {
              showProgress = false;
            });
          }
        },
        padding: EdgeInsets.all(12),
        color: Color(0xff0E2D4F),
        child: Text('Continuar', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Registrarse"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formkey,
          child: GestureDetector(
            onTap: () {
              final FocusScopeNode focus = FocusScope.of(context);
              if (!focus.hasPrimaryFocus && focus.hasFocus) {
                FocusManager.instance.primaryFocus.unfocus();
              }
            },
            child: ModalProgressHUD(
              inAsyncCall: showProgress,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                children: <Widget>[
                  Text("CREA TU CUENTA",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold ),textAlign:TextAlign.center,),
                  SizedBox(height: 20),
                  tipod,
                  SizedBox(height: 8.0),
                  documento,
                  SizedBox(height: 8.0),
                  nombre,
                  SizedBox(height: 8.0),
                  telefono,
                  SizedBox(height: 8.0),
                  email,
                  SizedBox(height: 8.0),
                  password,
                  SizedBox(height: 8.0),
                  postPassword,
                  acepto2,
                  SizedBox(height: 1.0),
                  loginButton
                ],
              ),
            ),
          ),
        ),
      ),
    );
    
  }

   void getSecureStorage() async {
    final isUsingBio = await storage.read(key:"perm");
    setState(() {
      _isBiometricAvailable = isUsingBio == 'true';
    });
  }
}
