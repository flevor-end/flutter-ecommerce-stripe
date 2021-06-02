import 'package:flutter/material.dart';
import 'package:masdamas/screens/Services/components/services_card.dart';
import '../../products/products_screen.dart';

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        spacing: 0,
        runSpacing: 10,
        children: <Widget>[
          ServicesCard(
            shoppingCardNum: 'Computadores',
            isDone: true,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductCategoryScreen()),
              );
            },
          ),
          ServicesCard(
            shoppingCardNum: 'Celulares',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductCategoryScreen()),
              );
            },
          ),
          ServicesCard(
            shoppingCardNum: 'Audifonos',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductCategoryScreen()),
              );
            },
          ),
          ServicesCard(
            shoppingCardNum: 'Accesorios',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductCategoryScreen()),
              );
            },
          ),
          ServicesCard(
            shoppingCardNum: 'Smartwacth',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductCategoryScreen()),
              );
            },
          ),
          ServicesCard(
            shoppingCardNum: 'Televisores',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductCategoryScreen()),
              );
            },
          ),
          ServicesCard(
            shoppingCardNum: 'Camaras',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductCategoryScreen()),
              );
            },
          ),
          ServicesCard(
            shoppingCardNum: 'Repuestos',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductCategoryScreen()),
              );
            },
          ),
          ServicesCard(
            shoppingCardNum: 'Softwares',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductCategoryScreen()),
              );
            },
          ),
          ServicesCard(
            shoppingCardNum: 'Equipos',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductCategoryScreen()),
              );
            },
          ),
          ServicesCard(
            shoppingCardNum: 'Parlantes',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductCategoryScreen()),
              );
            },
          ),
          ServicesCard(
            shoppingCardNum: 'Seguridad',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductCategoryScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
