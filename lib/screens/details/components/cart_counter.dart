import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/size_config.dart';

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'CANTIDAD'
        ),
        const SizedBox(width: 16),
        buildoutlineButton(
          icon: Icons.remove,
          press: (){
            if (numOfItems > 1){
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:5),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildoutlineButton(
          icon: Icons.add,
          press: (){
            setState(() {
                numOfItems++;
            });
          },
        ),
        
      ],
    );
  }

  SizedBox buildoutlineButton({IconData icon, Function press}) {
    return SizedBox(
        width: 27, 
        height: 23,
        child: OutlineButton(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: press,
          child: Icon(icon,color: kPrimaryColor,size: SizeConfig.screenWidth * 0.033,
          
        ),)

  );
  }
}