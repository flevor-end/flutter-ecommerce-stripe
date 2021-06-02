import 'package:flutter/material.dart';
import 'package:masdamas/screens/Domicilios/components/billetes_card.dart';
import 'domicilios_card.dart';
import '../../products/products_screen.dart';

class DomiciliosItems extends StatelessWidget {
  const DomiciliosItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        spacing: 4,
        runSpacing: 10,
        children: <Widget>[
          DomiciliosCard(
            icon: "assets/icons/categodomi5.svg",
            shoppingCardNum: 'Restaurantes',
            isDone: true,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductCategoryScreen()),
              );
            },
          ),
          DomiciliosCard(
              icon: "assets/icons/categodomi1.svg",
              shoppingCardNum: 'Cafes',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductCategoryScreen()),
                );
              }),
          DomiciliosCard(
              icon: "assets/icons/categodomi3.svg",
              shoppingCardNum: 'Mercado',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductCategoryScreen()),
                );
              }),
          DomiciliosCard(
              icon: "assets/icons/categodomi4.svg",
              shoppingCardNum: 'Express',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductCategoryScreen()),
                );
              }),
          DomiciliosCard(
              icon: "assets/icons/categodomi12.svg",
              shoppingCardNum: 'fruver',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductCategoryScreen()),
                );
              }),
          DomiciliosCard(
              icon: "assets/icons/categodomi2.svg",
              shoppingCardNum: 'Droguerias',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductCategoryScreen()),
                );
              }),
          DomiciliosCard(
              icon: "assets/icons/categodomi6.svg",
              shoppingCardNum: 'Floristerias',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductCategoryScreen()),
                );
              }),
          DomiciliosCard(
              icon: "assets/icons/categodomi7.svg",
              shoppingCardNum: 'Ferreterias',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductCategoryScreen()),
                );
              }),
          DomiciliosCard(
              icon: "assets/icons/categodomi11.svg",
              shoppingCardNum: 'Licores',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductCategoryScreen()),
                );
              }
              ),
          DomiciliosCard(
              icon: "assets/icons/categoria4.svg",
              shoppingCardNum: 'Mascotas',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductCategoryScreen()),
                );
              }),
          DomiciliosCard(
              icon: "assets/icons/categodomi12.svg",
              shoppingCardNum: 'Vida Sana',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductCategoryScreen()),
                );
              }),
          DomiciliosCard(
              icon: "assets/icons/categodomi10.svg",
              shoppingCardNum: 'Exprees',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductCategoryScreen()),
                );
              }),
          
        ],
      ),
    );
  }
}
