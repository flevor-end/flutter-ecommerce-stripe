import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    Key key,
    this.images,
  }) : super(key: key);

  final String images;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              //margin: EdgeInsets.symmetric(vertical: 6),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: kSecondaryColor),
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    images,
                  ),
                ),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
