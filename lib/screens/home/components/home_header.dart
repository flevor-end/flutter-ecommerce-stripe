import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/components/camscreen.dart';
import 'package:masdamas/components/dialog_ubication.dart';
import 'package:masdamas/components/dialogb.dart';
import 'package:masdamas/components/dialogshare.dart';
import 'package:masdamas/components/mic_screen.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/home/components/menulateral.dart';
import 'package:masdamas/sizec.dart';

class HomeHeader extends StatefulWidget {
  static String routeName = 'homeheader';
  const HomeHeader({Key key, this.state}) : super(key: key);

  final String state;
  _HomeHeaderState createState() => new _HomeHeaderState(this.state);
}

class _HomeHeaderState extends State<HomeHeader> {
  String ubication = "    Tu Ubicacion    ";
  static final GlobalKey<ScaffoldState> scaffoldKey =
      new GlobalKey<ScaffoldState>();
  _HomeHeaderState(String estado) {
    this.esta = estado;
  }
  String esta;
  bool color;

  TextEditingController _searchQuery;

  String searchQuery = "Search query";

  @override
  void initState() {
    super.initState();
    _searchQuery = new TextEditingController();
    color = false;
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
      _searchQuery.clear();
    });
  }

  Widget _buildcomplete(BuildContext context) {
    return new Row(
      
      mainAxisAlignment :MainAxisAlignment.end,
      children: <Widget>[

      // Align(
      //   alignment: Alignment.center,
      //   child: Text(ubication,
      //       style: TextStyle(
      //           color: color ? kSecondaryColor : Colors.grey[600],
      //           fontWeight: FontWeight.bold,
      //           fontSize: 12)),
      //   widthFactor: 0.79,
      // ),
      // Padding(
      //     padding: EdgeInsets.only(bottom: 5),
      //     child: IconButton(
      //       icon: SvgPicture.asset("assets/icons/arrowdown.svg"),
      //       onPressed: () {
      //         _awaitReturnValueFromSecondScreen(context);
      //       },
      //       iconSize: 22,
      //     )),
    
        Align(child:IconButton(
        icon: Icon(Icons.search, color: kSecondaryColor),
        onPressed: () {
          showDialog(context: context, builder: (buildcontext) => DialogB());
        },
        iconSize: 25,
      ),widthFactor: 0.8),
      Align(child:Text('Buscar',
             style: TextStyle(
                 color:  kSecondaryColor,
                 fontSize: 13)),widthFactor: Sizec.screenWidth/640,alignment: Alignment.center,),
      //  Align(child:IconButton(
      //   icon: Icon(Icons.camera_alt_outlined, color: kSecondaryColor),
      //   onPressed: () {
      //     showDialog(context: context, builder: (buildcontext) => Camscreen());
      //   },
      //   iconSize: 22,
      // ),widthFactor: 0.66,),
        SizedBox(width: Sizec.screenWidth/2.9),
        Align(alignment:Alignment.bottomLeft, child:IconButton(
        icon: SvgPicture.asset("assets/icons/microfonoblanco.svg"),
         onPressed:() {
          showDialog(context: context, builder: (buildcontext) => Micscreen());
        },
        iconSize: 57,
        ),widthFactor: Sizec.screenWidth/6000),


       Align(alignment:Alignment.topRight, 
       widthFactor: Sizec.screenWidth/230,
       child:IconButton(
        icon: SvgPicture.asset("assets/icons/camarablanca.svg"),
         onPressed: () {
          showDialog(context: context, builder: (buildcontext) => Camscreen());
        },
        
     )
  ),
      
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
      color:kSecondaryColor,
      
        height: 65,
        child: Row(children: <Widget>[
         Container(
          height: 40,
          width: Sizec.screenWidth/9.5,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(6),bottomRight:Radius.circular(6))
              
            ),
          child: Align(
                 alignment: Alignment.centerLeft,
                child: IconButton(
                  icon:Icon(Icons.menu,color: Colors.white),
                  onPressed: (){showDialog(context: context, builder: (buildcontext) => Menulateral());},
                  color:Colors.red,
               ),
              ),
         ),
          SizedBox(width: 10),
         GestureDetector(
  // When the child is tapped, show a snackbar.
  onTap: () {
 showDialog(context: context, builder: (buildcontext) => DialogB());
  },
  // The custom button
  child: Container(
            height: 40,
            width: Sizec.screenWidth/1.36,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: _buildcomplete(context),
          ),
         ),
            SizedBox(width: 8),
           Container(
          height: 40,
          width:Sizec.screenWidth/9,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(6),bottomLeft:Radius.circular(6))
          ),
         child: IconButton(
         icon:  SvgPicture.asset("assets/icons/Grupo 4038.svg"),
         onPressed: (){ showDialog(context: context, builder: (buildcontext) => DialogS());},
         iconSize: 30,
      ),
        ),
      ]),
      ),
    );
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await showDialog(
      context: context,
      builder: (buildcontext) => DialogU(),
      barrierDismissible: false,
    );

    setState(() {
      ubication = result;
      color = true;
    });
  }
}
