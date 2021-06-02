import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/models/Product.dart';

import 'package:masdamas/screens/products/components/product_item_card.dart';


import '../sizec.dart';

class CamDialog extends StatefulWidget {
   static String routeName = 'camdialog';
  const CamDialog({
    Key key,
    @required this.destino,
  }) : super(key: key);

  final List destino;
   @override
  _CamDialogState createState() => new _CamDialogState();
}

class _CamDialogState extends State<CamDialog> {
  String text = "ga";
  final TextEditingController _textEditingController = TextEditingController();
  int index;
  List<Product> products = [];
  bool isItemClicked = false;

  List<Product> results = [];

  @override
  void initState() {
    super.initState();

  
      
        setState(() {
          results = products
              .where(
                (element) =>
                    element.title.startsWith(text),
              )
              .toList();
          if (results.length > 3) {
            results = results.sublist(0, 0);
          }
        });
      
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _startSearch() {
    setState(() {});
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {});
  }

  void _clearSearchQuery() {
    setState(() {
      _textEditingController.clear();
    });
  }

  Widget _getProduct() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Wrap(
          children: [
            ...List.generate(
              results.length,
              (index) => Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(10),
                  horizontal: getProportionateScreenWidth(10),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [kDefaultShadow],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ProductItemCard(
                      
                        
                      ),
                    ),
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    Sizec().init(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Container(
            height: 47,
            padding: EdgeInsets.only(top: 6, left: 12, right: 8),
            child: Row(children: <Widget>[

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[350], width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: _textEditingController,
                        onTap: () {
                          setState(() {
                            if (isItemClicked) {
                              isItemClicked = !isItemClicked;
                            }
                          });
                        },
                        autofocus: false,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                width: 1.5, color: Colors.transparent),
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 1),
                          prefixIcon: IconButton(
                            icon:
                                Icon(Icons.arrow_back, color: kSecondaryColor),
                            onPressed: () {
                             Navigator.of(context).popUntil((route) => route.isFirst);
                            },
                            iconSize: 22,
                          ),
                          hintText: '¿Que Buscas?',
                          hintStyle: TextStyle(
                              fontSize: 13,
                              color: Color(0xff0E2D4F),
                              fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                                width: 1.5, color: Colors.transparent),
                          ),
                        ),
                        autocorrect: false,
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(Icons.mic, color: kSecondaryColor),
                          onPressed: null,
                        ),
                        widthFactor: 0),
                    IconButton(
                      icon: Icon(Icons.clear, color: kSecondaryColor),
                      onPressed: () {
                        _clearSearchQuery();
                      },
                      iconSize: 22,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
        leading: Container(),
      ),
      body:Column(children: [
   
     !isItemClicked ? Container(child: _getProduct()) : Container(),
     

      
      ],)
    );
  }
}
