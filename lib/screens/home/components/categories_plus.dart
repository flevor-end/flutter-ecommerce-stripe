import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/sizec.dart';

class CategoriesPlus extends StatefulWidget {
  @override
  _CategoriesPlusState createState() => _CategoriesPlusState();
}

class _CategoriesPlusState extends State<CategoriesPlus> {
  int selectedCategory = 0;
  List<String> categoriesPlus = [
    "10 - 15 Dias",
    "Horario Laboral",
    "Efectivo",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10) / 2),
      height: 80,
      decoration: BoxDecoration(
        color: kSecondaryColor,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesPlus.length,
        itemBuilder: (context, index) => buildCategory(index, context),
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 4),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: Column(
          children: <Widget>[
            Container(
              width: getProportionateScreenWidth(110),
              margin: EdgeInsets.symmetric(
                  vertical: (kDefaultPadding / 2),
                  horizontal: (kDefaultPadding / 6)),
              padding: EdgeInsets.symmetric(
                horizontal: (kDefaultPadding / 2),
                vertical: (kDefaultPadding / 2),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: index == selectedCategory
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                categoriesPlus[index],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: index == selectedCategory
                          ? Colors.white
                          : Colors.white.withOpacity(0.4),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleCArd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> titleCard = ["Disponibilidad", "Entrega", "Opciones de pago"];
    return Container();
  }
}
