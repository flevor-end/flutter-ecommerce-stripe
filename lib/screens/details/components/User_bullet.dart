import 'package:flutter/material.dart';

import '../../../constants.dart';

class UsersBullet extends StatelessWidget {
  const UsersBullet({
    Key key, this.image, this.name,
  }) : super(key: key);

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        ClipOval(
              child: Image.asset(
                image,
                height: 32,
                width: 32,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              
              name
            ),
            Column(
              children: [
                FlatButton(
                  color: kPrimaryColor,
                  onPressed: () => {}, 
                  child: Column(
                    children: [
                      Text(
                        "UNETE YA",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      buildTimer(),
                    ],
                  )
                ),
                

              ],
            )
          ],
        ),
      );
  }
}


Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 00.0),
          duration: Duration(seconds: 60),
          builder: (_, value, child) => Text(
            "12:00:${value.toInt()}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }