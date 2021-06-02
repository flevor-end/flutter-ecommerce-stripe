import 'package:flutter/material.dart';
import 'shopping_card.dart';


class ShoppingItems extends StatelessWidget {
  const ShoppingItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        spacing: 5,
        runSpacing: 10,
        children: <Widget>[
          ShoppingCard(
            icon: "assets/icons/categoria7.svg",
            shoppingCardNum: 'Tecnología',
            colorBorder: Color(0xFFFF710F),
            isDone: false,
            press: () {},
          ),
          ShoppingCard(
            icon: "assets/icons/categoria8.svg",
            shoppingCardNum: 'Hogar',
            colorBorder: Color(0xFFFF710F),
            press: () {},
          ),
          ShoppingCard(
            icon: "assets/icons/categoria9.svg",
            shoppingCardNum: 'Moda',
            colorBorder: Color(0xFFFF710F),
            press: () {},
          ),
          ShoppingCard(
            icon: "assets/icons/categoria10.svg",
            shoppingCardNum: 'Deportes',
            colorBorder: Color(0xFFFF710F),
            press: () {},
          ),
          ShoppingCard(
            icon: "assets/icons/categoria1.svg",
            shoppingCardNum: 'Juegos',
            colorBorder: Color(0xFFFF710F),
            press: () {},
          ),
          ShoppingCard(
            icon: "assets/icons/categoria2.svg",
            shoppingCardNum: 'Infantil',
            colorBorder: Color(0xFFFF710F),
            press: () {},
          ),
          ShoppingCard(
            icon: "assets/icons/categoria11.svg",
            shoppingCardNum: 'Bienestar',
            colorBorder: Color(0xFFFF710F),
            press: () {},
          ),
          ShoppingCard(
            icon: "assets/icons/categoria3.svg",
            shoppingCardNum: 'Joyeria',
            colorBorder: Color(0xFFFF710F),
            press: () {},
          ),
          ShoppingCard(
            icon: "assets/icons/categoria4.svg",
            shoppingCardNum: 'Mascotas',
            colorBorder: Color(0xFFFF710F),
            press: () {},
          ),
          ShoppingCard(
            icon: "assets/icons/categoria12.svg",
            shoppingCardNum: 'Cocina',
            colorBorder: Color(0xFFFF710F),
            press: () {},
          ),
          ShoppingCard(
            icon: "assets/icons/categoria6.svg",
            shoppingCardNum: 'Viajes',
            colorBorder: Color(0xFFFF710F),
            press: () {},
          ),
          ShoppingCard(
            icon: "assets/icons/categoria5.svg",
            shoppingCardNum: 'Hotel',
            colorBorder: Color(0xFFFF710F),
            press: () {},
          ),
        ],
      ),
    );
  }
}
