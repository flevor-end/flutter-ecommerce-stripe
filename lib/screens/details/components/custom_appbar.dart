import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/components/rounded_icon_btn.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/cart/cart_screen.dart';
import 'package:masdamas/sizec.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;
  final bool hasTitle;
  final bool hasBackground;
  final GestureTapCallback press;
  CustomActionBar(
      {Key key,
      this.title,
      this.hasBackArrow,
      this.hasTitle,
      this.hasBackground,
      this.press})
      : super(key: key);

  final CollectionReference _usersRef =
      FirebaseFirestore.instance.collection("users");

  User _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = hasBackArrow ?? false;
    bool _hasTitle = hasTitle ?? true;

    return Container(
      padding: EdgeInsets.only(
        top: 26.0,
        left: 24.0,
        right: 24.0,
        bottom: 44.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_hasBackArrow)
            Container(
              width: 42.0,
              height: 42.0,
              decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(8.0)),
              alignment: Alignment.center,
              child: FlatButton(
                onPressed: press,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 16.0,
                ),
              ),
            ),
          if (_hasTitle)
            Text(
              title ?? "action bar",
              textAlign: TextAlign.center,
            ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ));
            },
            child: Container(
                width: 42.0,
                height: 42.0,
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(8.0)),
                alignment: Alignment.center,
                child: StreamBuilder(
                    stream:
                        _usersRef.doc(_user.uid).collection("Cart").snapshots(),
                    builder: (context, snapshot) {
                      int _totalItems = 0;

                      if (snapshot.connectionState == ConnectionState.active) {
                        List _documents = snapshot.data.docs;
                        _totalItems = _documents.length;
                      }

                      return Text(
                        "$_totalItems" ?? "0",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    })),
          ),
        ],
      ),
    );
  }
}
