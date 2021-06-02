import 'package:flutter/material.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/models/Product.dart';
import '../sizec.dart';
import 'fancytabbar.dart';

class DialogB extends StatefulWidget {
  const DialogB({
    Key key,
  }) : super(key: key);

  _DialogBState createState() => new _DialogBState();
}

class _DialogBState extends State<DialogB> {
  final TextEditingController _textEditingController = TextEditingController();
  int index;
  List<Product> products = [];
  bool isItemClicked = false;
  List<Product> results = [];

  @override
  void initState() {
    super.initState();

    _textEditingController
      ..addListener(() {
        setState(() {
          results = products
              .where(
                (element) =>
                    element.title.startsWith(_textEditingController.text),
              )
              .toList();
          if (results.length > 3) {
            results = results.sublist(0, 0);
          }
        });
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
                   
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getRichText(String result) {
    return RichText(
      text: _textEditingController.text.length > 0
          ? TextSpan(
              children: [
                if (_textEditingController.text.length > 0)
                  TextSpan(
                    text:
                        result.substring(0, _textEditingController.text.length),
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                    ),
                  ),
                TextSpan(
                  text: result.substring(
                      _textEditingController.text.length, result.length),
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[400],
                  ),
                )
              ],
            )
          : TextSpan(
              text: result,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[400],
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Sizec().init(context);
    return Scaffold(
      resizeToAvoidBottomInset:true,
      appBar: AppBar(
          title: Text("Busqueda"),
      ),
      body:Column(children: [
       Container(
         width: 280,
             decoration: BoxDecoration(
              
              borderRadius: BorderRadius.all( Radius.circular(3)),
             border: Border.all(
      color: kSecondaryColor, //                   <--- border color
      width: 1.8,
    ),
          ),
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(children: <Widget>[
            SizedBox(height: 15),
            Text("¿Que Buscas?",   style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),),
             TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(        
                      enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: kSecondaryColor),   
            ),  
                      focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kSecondaryColor),
            ),
                      border: UnderlineInputBorder(
                      borderSide: BorderSide(color: kSecondaryColor),
            ),
         ),
                        cursorColor:kPrimaryColor,
                        controller: _textEditingController,
                        onTap: () {
                          setState(() {
                            if (isItemClicked) {
                              isItemClicked = !isItemClicked;
                            }
                          });
                        },
                        
                       
                        autocorrect: false,
                      ),
                      SizedBox(height: 30),
                    
                 
                  ],
                ),
              ),
               !isItemClicked ? Container(child: _getProduct()) : Container(),
               Expanded(
            flex: 3,
            child: SizedBox(),),
               Expanded(
           
            child: FancyTabBar(),),
            ]),
          );
    
     

      
    
    
  }
}
