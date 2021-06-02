
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masdamas/blocs/user_controller.dart';
import 'package:masdamas/components/page_transicion.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/locator.dart';
import 'package:masdamas/models/user.dart' as model;





class ManageProfileInformationWidget extends StatefulWidget {
  final model.User currentUser;
 ManageProfileInformationWidget({this.currentUser});

  @override
  _ManageProfileInformationWidgetState createState() =>
      _ManageProfileInformationWidgetState();
}

class _ManageProfileInformationWidgetState
    extends State<ManageProfileInformationWidget> {
  User user = FirebaseAuth.instance.currentUser;
 final FirebaseFirestore _db = FirebaseFirestore.instance;
  String nam,cel,dir;
  var _displayNameController = TextEditingController();
  var _celularController = TextEditingController();
  var _direccionController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  bool checkCurrentPasswordValid = true;

  @override
  void initState() {
    _displayNameController.text = widget.currentUser.name;

    super.initState();
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _celularController.dispose();
    _direccionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Form(
                key: _formKey,
                child:Column(
                  children: <Widget>[
     Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: TextFormField(
        controller: _displayNameController,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Por favor ingrese su nuevo nombre';
          }
          return null;
        },
        autofocus: false,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 2, color: kPrimaryColor),
          ),
          prefixIcon: Icon(Icons.person, color: Colors.black),
          hintText: 'Nombre',
          hintStyle: TextStyle(fontSize: 13),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ),
     Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: TextFormField(
        controller: _celularController,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Por favor ingrese su nuevo numero de celular';
          }
          return null;
        },
        autofocus: false,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 2, color: kPrimaryColor),
          ),
          prefixIcon: Icon(Icons.phone_android, color: Colors.black),
        
          hintText: 'Numero celular',
          hintStyle: TextStyle(fontSize: 13),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: TextFormField(
        controller: _direccionController,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Por favor ingrese su direccion';
          }
          return null;
        },
        autofocus: false,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 2, color: Color(0xff0E2D4F)),
          ),
          prefixIcon: Icon(Icons.map, color: Colors.black),
          hintText: 'Direccion',
          hintStyle: TextStyle(fontSize: 13),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ),
  
     RaisedButton(
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
       color: kSecondaryColor,
       textColor: Colors.white,
              onPressed: () async {
               var userController = locator.get<UserController>();

                if (widget.currentUser.name !=
                    _displayNameController.text) {
                  var dName = _displayNameController.text;
                  userController.updateDisplayName(dName);
    DocumentReference ref = _db.collection("users").doc(user.uid);
    ref.set({
    'name':dName,
    }, SetOptions(merge: true));
                }

        Navigator.of(context).pushNamedAndRemoveUntil(
        Transicion.routeName, (Route<dynamic> route) => false);

              },
              child: Text("Guardar Perfil"),
            ) 
         ],
      ),
    );
    
  
  }
}