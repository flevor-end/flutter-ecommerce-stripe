import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:masdamas/blocs/bloc_use.dart';
import 'package:masdamas/blocs/user_controller.dart';
import 'package:masdamas/components/cicons_icons.dart';
import 'package:masdamas/components/codigo_error.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/locator.dart';
import 'package:masdamas/screens/forgot_password/olvide.dart';
import 'package:masdamas/screens/sign_in/login_huella.dart';
import 'package:masdamas/screens/sign_up/registro.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_auth/local_auth.dart';
import 'package:masdamas/models/user.dart' as model;

import '../../sizec.dart';

class Login extends StatefulWidget {
  static String routeName = 'login';
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  model.User _currentUser;
  LocalAuthentication  _localAth;
  bool _isBiometricAvailable = false;
  final _auth = FirebaseAuth.instance;
  String error;
  String get geterror => error;
  UserBloc userBloc;
  final FlutterSecureStorage storage = FlutterSecureStorage();
  bool showProgress = false;
  String emai, passwor;
  bool _ocultar = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  SharedPreferences prefs;
   
  @override
  void initState() {
    super.initState();
    getSecureStorage();
  }

 
  
    @override
    Widget build(BuildContext context) {
      userBloc = BlocProvider.of(context);
  
      final logo = Padding(
        padding: EdgeInsets.symmetric( horizontal: 20),
        child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 80.0,
            child: Image.asset('assets/images/logoapp.png'),
          ),
        ),
      );
  
      final email = Padding(
        padding: EdgeInsets.symmetric(vertical: 2.0),
        child: TextFormField(
          onChanged: (value) {
            emai = value; // obtener valor del text field
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
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 1.6, color: Color(0xff0E2D4F)),
            ),
            prefixIcon: Icon(Icons.email_outlined, color: kPrimaryColor),
            hintText: 'Correo Electronico',
            hintStyle: TextStyle(fontSize: 13),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 1.6, color: Color(0xff0E2D4F)),
            ),
          ),
          autocorrect: false,
        ),
      );
  
      final password = Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5),
        child: TextFormField(
          onChanged: (value) {
            passwor = value; //obtener valor del textfield
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'Por favor ingrese su contraseña';
            }
            return null;
          },
          autofocus: false,
          obscureText: _ocultar,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 1.6, color: Color(0xff0E2D4F)),
            ),
            prefixIcon: Icon(Icons.https_outlined, color: kPrimaryColor),
            suffixIcon: IconButton(
              icon: Icon(Icons.visibility, color: kPrimaryColor),
              onPressed: () {
                setState(() {
                  _ocultar = !_ocultar;
                });
              },
            ),
            hintText: 'Contraseña',
            hintStyle: TextStyle(fontSize: 13),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 1.6, color: Color(0xff0E2D4F)),
            ),
          ),
        ),
      );
  
      final loginButton = 
        MaterialButton(
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
                
                User user = (await _auth.signInWithEmailAndPassword(
                email: emai, password: passwor)).user; 
                if(!_isBiometricAvailable){
                 storage.write(key: "email",value: emai);
                 storage.write(key: "pass",value:passwor);
                }     
                locator<UserController>().signI();
                  await prefs.setString('id', _auth.currentUser.uid);
                  await prefs.setString('nickname', _auth.currentUser.displayName);
                  await prefs.setString('photoUrl', _auth.currentUser.photoURL);

                  if (user.phoneNumber==null) {
                   Navigator.push(context,MaterialPageRoute(builder: (context) => Codigoerror()));
                  setState(() {
                    showProgress = false;
                  });
                }
                if (user != null ) {
             
                  setState(() {
                    showProgress = false;
                  });
                }
              } catch (e) {
                switch (e.code) {
                  case "user-not-found":
                    error = 'Usuario Inexistente';
                    Fluttertoast.showToast(
                        msg: error,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: kSecondaryColor,
                        textColor: Colors.white,
                        fontSize: 2);
                    break;
                  case "wrong-password":
                    error = 'Clave Erronea';
                    Fluttertoast.showToast(
                        msg: error,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor:kSecondaryColor,
                        textColor: Colors.white,
                        fontSize:20);
                    break;
                    case "object-not-found":
                    error = 'Complete su Registro';
                    Fluttertoast.showToast(
                        msg: error,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: kSecondaryColor,
                        textColor: Colors.white,
                        fontSize: 20);
                        break;
                     default:
                    print(e);
  
                    break;
                }
                setState(() {
                  showProgress = false;
                });
              }
            } else {
              setState(() {
                showProgress = false;
              });
            }
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(14),
          color: kPrimaryColor,
          child: Text('Iniciar Sesion',
              style: TextStyle(color: Colors.white, fontSize: 15)),
        
      );
  
      final forgotLabel = FlatButton(
        child: Text(
          'Olvidé Mi Contraseña',
          style: TextStyle(
              color: Color(0xff0E2D4F),
              decoration: TextDecoration.underline,
              fontSize: 15),
        ),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Olvide()),
          );
        },
      );
  
      final googleb = Padding(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 30),
        child: RaisedButton.icon(
          onPressed: () {
            userBloc.loging();
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          label: Text(
            ' Ingresa con google',
            style: TextStyle(color: Colors.grey[600]),
          ),
          icon: Icon(Cicons.g_19, color: Colors.red[900], size: 30),
          textColor: Colors.grey[600],
          padding: EdgeInsets.all(8),
          splashColor: Colors.grey[600],
          color: Colors.white,
        ),
      );
  
      final faceb = Padding(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
        child: RaisedButton.icon(
          onPressed: () {},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          label: Text(
            ' Ingresa con Facebook',
            style: TextStyle(color: Colors.grey[600]),
          ),
          icon: Icon(Cicons.f_negra_19, color: Colors.blue[900], size: 30),
          textColor: Colors.grey[600],
          padding: EdgeInsets.all(8),
          splashColor: Colors.grey[600],
          color: Colors.white,
        ),
      );
  
      final socialbuttoms = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 83,
              width: 83,
              child: IconButton(
                  icon: Image.asset('assets/images/google.png'), onPressed: null),
            ),
            SizedBox(
              height: 83,
              width: 83,
              child: IconButton(
                  icon: Image.asset('assets/images/facebook.png'),
                  onPressed: null),
            ),
            SizedBox(
              height: 83,
              width: 83,
              child: IconButton(
                  icon: Image.asset('assets/images/instagram.png'),
                  onPressed: null),
            ),
            SizedBox(
              height: 83,
              width: 83,
              child: IconButton(
                  icon: Image.asset('assets/images/twitter.png'),
                  onPressed: null),
            ),
          ]);
  
      final registra = Padding(
        padding: EdgeInsets.symmetric(horizontal: 80),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Registro()),
            );
          },
          padding: EdgeInsets.all(15),
          color: Color(0xff0E2D4F),
          child: Text('! Registrate Ya !', style: TextStyle(color: Colors.white)),
        ),
      );
  
      return Scaffold(
        resizeToAvoidBottomInset:false,
        appBar: AppBar(
          title: Text("Iniciar Sesion"),
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
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height:145,child:logo,),
                      SizedBox(height: 15),
             Container(
              height: 33,
              width: Sizec.screenWidth,
              decoration: BoxDecoration(
                color: kSecondaryColor
              ),
                
          child: 
     
    Align(child: Text("INGRESA Y DISFRUTA",style:TextStyle(color:Colors.white,fontSize: 18,fontWeight:FontWeight.bold )),widthFactor: 2.8,),
    
  ), 
                      SizedBox(height: 15),
                      Row(children:[ SizedBox(width: 12,),Column(children:[ SizedBox(width: 265,height: 50,child:email,),SizedBox(height:10),SizedBox(width:265,height: 50,child:password,),],),SizedBox(width:10),
                     GestureDetector(
                       onTap:(){ Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginHuella()),
            ); },
                                              child: Container( height: 105,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                        borderRadius:BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: kSecondaryColor,width: 1.8),
                        ),width:75,child:Image.asset("assets/images/huella.png",) ,),
                      ),
   ]),
                      SizedBox(height:23),
                      Column(
                      crossAxisAlignment : CrossAxisAlignment.center,
                      children: [
                      SizedBox(width:190,child:loginButton,),
                      forgotLabel,
                      SizedBox(height:33),
                      registra,
                        ],
                      ),
                     ],
                  ),
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

  