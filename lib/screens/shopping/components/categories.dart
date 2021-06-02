import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/constants.dart';

class  Categorieso extends StatefulWidget {
  int colorVal;
  Categorieso(this.colorVal);

  @override
  _CategoriesoState createState() => _CategoriesoState();
}

class _CategoriesoState extends State<Categorieso>
  with SingleTickerProviderStateMixin {
    TabController _tabController;


  @override
  @override
  void initState() { 
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }
  void _handleTabSelection() {
    setState(() {
      widget.colorVal = 0xFFFF710F;
    });
  }

  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/monedasmasbit.svg", "text": " Compras MASBIT"},
      {"icon": "assets/icons/chat.svg", "text": "Chat"},
      {"icon": "assets/icons/AB1.svg", "text": "Visitados"},
      {"icon": "assets/icons/AB4.svg", "text": "Compartir"},
    ];

    return Container(
      
        child: Wrap(children: <Widget>[
          Container(
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                    categories.length,
                    (index) => CategoryCard(
                          icon: categories[index]["icon"],
                          text: categories[index]["text"],
                          press: () {},
                          customColor: Color(widget.colorVal),
                        ))
              ],
            ),
          ),
        ]),
      
    );
  }
}

class CategoryCard extends StatefulWidget {


  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press, 
    @required this.customColor,


   
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;
  final Color customColor;

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.press,
      child: SizedBox(
        width: size.width * 0.25,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 3.4,
              child: Container(
                padding: EdgeInsets.only(top: 2,bottom: 3),
                child: SvgPicture.asset(
                  widget.icon,
                  color: widget.customColor,
                 
                  
                ),
              ),
            ),
            Text(
              widget.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kSecondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
