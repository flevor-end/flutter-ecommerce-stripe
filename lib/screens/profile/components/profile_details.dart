import 'package:flutter/material.dart';



class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key key,
    @required this.text,
    this.letra,

  }) : super(key: key);

  final String text;
  final int letra;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
               Center(
        child: 
        text == null
            ? Text(
                "",
              )
            : Text(
                text,
                style: TextStyle(fontSize: 18,),
              ),

            ),
          ],
        ),
    );
  }
}
