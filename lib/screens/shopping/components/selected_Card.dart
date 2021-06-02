import 'package:flutter/material.dart';

import 'package:masdamas/constants.dart';

class SelectedCard extends StatefulWidget {
  final String title, btnDes, text;

  final bool isDone;
  final Function press;
  const SelectedCard({
    Key key,
    this.isDone = false,
    this.press,
    this.title,
    this.btnDes,
    this.text,
  }) : super(key: key);

  @override
  _SelectedCardState createState() => _SelectedCardState();
}

class _SelectedCardState extends State<SelectedCard> {
  String _typeValue;
  List _typeProduct = ["All in one", "One an one", "All"];

  _SelectedCardState();

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        width: 90,
        child: Column(
          children: <Widget>[
            SizedBox(height: 5),
            Text(
              "${widget.title}",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.80),
              child: Container(
                height: 37,
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButton(
                  hint: Text(
                    "${widget.btnDes}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontSize: 12),
                  ),
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  iconSize: 0,
                  underline: Container(
                    height: 0,
                  ),
                  style: TextStyle(fontSize: 12),
                  value: _typeValue,
                  onChanged: (value) {
                    setState(() {
                      _typeValue = value;
                    });
                  },
                  items: _typeProduct.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: kSecondaryColor),
                      ),
                    );
                  }).toList(),
                ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Column(
                //     children: [
                //       SizedBox(
                //         child: Text(
                //           "${widget.btnDes}",
                //           style: TextStyle(color: Colors.white),
                //           //width: size.width * 0.15,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
