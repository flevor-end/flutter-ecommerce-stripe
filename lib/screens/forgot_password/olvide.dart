import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:masdamas/components/categoriastitle.dart';
import 'package:masdamas/screens/home/home.screen.dart';

import 'package:masdamas/screens/sign_in/login.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Olvide extends StatefulWidget {
  @override
  _OlvideState createState() => new _OlvideState();
}

class _OlvideState extends State<Olvide> {
  String error;
  String get geterror => error;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String emai, passwor;
  bool showProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recuperar Contrasena"),
      ),
      body: Form(
        key: _form,
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
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
                    child: Hero(
                      tag: 'hero',
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 90.0,
                        child: Image.asset('assets/images/logoapp.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                    child:Categoriastitle(text: "Restablecer Contraseña",),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                    child: TextFormField(
                      onChanged: (value) {
                        emai = value; // obtener valor del text field
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Por favor ingrese su email';
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
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff0E2D4F)),
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.black),
                        hintText: 'Ingrese su correo',
                        hintStyle: TextStyle(fontSize: 15),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                      autocorrect: false,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: MaterialButton(
                      onPressed: () async {
                        final FocusScopeNode focus = FocusScope.of(context);
                        if (!focus.hasPrimaryFocus && focus.hasFocus) {
                          FocusManager.instance.primaryFocus.unfocus();
                        }
                        setState(() {
                          showProgress = true;
                        });
                        if (_form.currentState.validate()) {
                          try {
                            await _auth.sendPasswordResetEmail(email: emai);
                            if (emai != null) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Se Ha Eviado un correo para cambiar su contraseña",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: Color(0xff0E2D4F),
                                  textColor: Colors.white,
                                  fontSize: 20.0);
                              setState(() {
                                showProgress = false;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                );
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
                                    backgroundColor: Color(0xff0E2D4F),
                                    textColor: Colors.white,
                                    fontSize: 16.0);
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
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(15),
                      color: Color(0xff0E2D4F),
                      child: Text('Recuperar Clave ',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  FlatButton(
                      child: Text(
                        'Regresar a Inicio',
                        style: TextStyle(
                            color: Color(0xff0E2D4F),
                            decoration: TextDecoration.underline,
                            fontSize: 15),
                      ),
                      onPressed: () =>
                      Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.routeName, (Route<dynamic> route) => false),),
                ]),
          ),
        ),
      ),
    );
  }
}
