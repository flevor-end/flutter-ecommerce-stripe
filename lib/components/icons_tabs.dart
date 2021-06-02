import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/constants.dart';

import '../size_config.dart';

class  IconsTabs extends StatefulWidget {
  int colorVal;
  IconsTabs(this.colorVal);

  @override
  _IconsTabsState createState() => _IconsTabsState();
}

class _IconsTabsState extends State<IconsTabs>
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
      {"icon": "assets/icons/Heart Icon.svg", "text": "Me Gusta"},
    ];

    return Container(
      
        child: Wrap(children: <Widget>[
          Container(
            height: SizeConfig.screenHeight * 0.06,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    
    return GestureDetector(
      onTap: widget.press,
      child: SizedBox(
        child: Column(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: SvgPicture.asset(
                      widget.icon,
                      color: widget.customColor,
                      
                    ),
                  ),
                ),
              ),
            SizedBox(height: 2),
              Text(
                widget.text,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: getProportionateScreenHeight(12),
                  fontWeight: FontWeight.w900,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            
          ],
        ),
      ),
    );
  }
}