import 'package:flutter/material.dart';

import '../../../constants.dart';

class Categorytabs extends StatefulWidget {
  const Categorytabs({
    Key key,
  }) : super(key: key);

  @override
  _CategorytabsState createState() => _CategorytabsState();
}

class _CategorytabsState extends State<Categorytabs> {
  int selectedIndex = 0;
  List categories = [
    'Con Cargador',
    'Celulares',
    'Audifonos',
    'Acsesorios',
    'SmartWacth',
    'Televisores',
    'Camara',
    'Repuestos',
    'Software',
    'Equipos',
    'Parlantes',
    'Seguridad'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        height: 35,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: kDefaultPadding),
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    decoration: BoxDecoration(
                      color: index == selectedIndex
                          ? kPrimaryColor
                          : kSecondaryColor.withOpacity(0.14),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      
                    categories[index],
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: index == selectedIndex
                              ? Colors.white
                              : kSecondaryColor),
                    ),
                  ),
                )));
  }
}
