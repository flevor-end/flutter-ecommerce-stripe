import 'package:flutter/material.dart';
import 'package:masdamas/screens/Forless/components/forless_card.dart';

class ForlessItems extends StatelessWidget {
  const ForlessItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        spacing: 4,
        runSpacing: 10,
        children: <Widget>[
          ForlessCard(
            icon: "assets/icons/categoriaservicios1.svg",
            shoppingCardNum: 'Computadores',
            isDone: true,
            press: () {},
          ),
          ForlessCard(
            icon: "assets/icons/categoriaservicios6.svg",
            shoppingCardNum: 'Hogar',
            isDone: true,
            press: () {},
          ),
          ForlessCard(
            icon: "assets/icons/categoriaservicios2.svg",
            shoppingCardNum: 'Oficina',
            isDone: true,
            press: () {},
          ),
          ForlessCard(
            icon: "assets/icons/categoriaservicios12.svg",
            shoppingCardNum: 'Juegos',
            isDone: true,
            press: () {},
          ),
          ForlessCard(
            icon: "assets/icons/categoriaservicios11.svg",
            shoppingCardNum: 'Moda',
            isDone: true,
            press: () {},
          ),
          ForlessCard(
            icon: "assets/icons/categoriaservicios3.svg",
            shoppingCardNum: 'Auto Partes',
            isDone: true,
            press: () {},
          ),
          ForlessCard(
            icon: "assets/icons/categoriaservicios4.svg",
            shoppingCardNum: 'Muebles',
            isDone: true,
            press: () {},
          ),
          ForlessCard(
            icon: "assets/icons/categoriaservicios5.svg",
            shoppingCardNum: 'Maquinaria',
            isDone: true,
            press: () {},
          ),
          ForlessCard(
            icon: "assets/icons/categoriaservicios7.svg",
            shoppingCardNum: 'Antiguedades',
            isDone: true,
            press: () {},
          ),
          ForlessCard(
            icon: "assets/icons/categoriaservicios8.svg",
            shoppingCardNum: 'Camaras',
            isDone: true,
            press: () {},
          ),
          ForlessCard(
            icon: "assets/icons/categoriaservicios10.svg",
            shoppingCardNum: 'Deportes',
            isDone: true,
            press: () {},
          ),
          ForlessCard(
            icon: "assets/icons/categoriaservicios9.svg",
            shoppingCardNum: 'Libros',
            isDone: true,
            press: () {},
          ),
        ],
      ),
    );
  }
}
