import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:masdamas/blocs/user_controller.dart';
import 'package:masdamas/locator.dart';
import 'package:masdamas/screens/components/manage_profile.dart';
import 'package:masdamas/sizec.dart';
import 'package:masdamas/models/user.dart' as Model;
import 'package:firebase_auth/firebase_auth.dart';

class Profiled extends StatefulWidget {
  @override
  _ProfiledState createState() => _ProfiledState();
}

class _ProfiledState extends State<Profiled> {
  File _image;
  final picker = ImagePicker();
  Model.User _currentUser = locator.get<UserController>().currentUser;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ManageProfileInformationWidget(
                  currentUser: _currentUser,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
