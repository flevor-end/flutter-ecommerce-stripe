import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';

import 'Selected_Card.dart';

class SelectedItems extends StatelessWidget {
  const SelectedItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: (10),
          ),
          Container(
            width: 390,
            padding: EdgeInsets.symmetric(vertical: 5),
            color: kSecondaryColor,
            child: Text(
              "CRITERIO DE BUSQUEDA",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: (10),
          ),
          Wrap(
            spacing: 0,
            runSpacing: 3,
            children: <Widget>[
              SelectedCard(
                title: "Tipo:",
                isDone: true,
                btnDes: 'All in one',
              ),
              SelectedCard(
                title: "Rango de Precio:",
                isDone: true,
                btnDes: '+ 2.000.000',
              ),
              SelectedCard(
                title: "Marca:",
                isDone: true,
                btnDes: 'Apple',
              ),
              SelectedCard(
                title: "Ciudad:",
                isDone: true,
                btnDes: 'Bogota',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
