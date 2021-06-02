
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/components/mapScreen.dart';
import 'package:masdamas/constants.dart';




class DialogU extends StatefulWidget {
  @override
  _DialogUState createState() => _DialogUState();
}

class _DialogUState extends State< DialogU> {
  String mapdireccion;
  String _adressValue;
  String text;
 
  bool color1;
  bool color2;
  bool color3;
  bool color4;

 List<String>list=[" Cra. 67A #95-80  ", "     Tv 27 #57-81     ", "Calle 86A.#67-89"]; 

  @override
   void initState() {
    super.initState();
    _adressValue = "    Tu Ubicacion   ";
   color1=false;
   color2=false;
   color3=false;
   color4=false;
   mapdireccion= "  Tu Ubicacion  ";
   
  }
  Widget build(BuildContext context) {
    
    return Dialog(
      insetPadding: EdgeInsets.fromLTRB(20.0, 27.0, 0, 0),      
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      ),      
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

   dialogContent(BuildContext context) {
  return  new Container(
    padding: EdgeInsets.only(
    top: 26,
    left: 1,
    right: 0,
  ),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
      image: DecorationImage(
      alignment: Alignment.topLeft, 
      image:AssetImage( 'assets/images/dialogbox.png',), fit:BoxFit.contain,),),
      child:Stack(
      children: <Widget>[
       Align(alignment: Alignment.centerRight,child: IconButton(icon: SvgPicture.asset("assets/icons/+.svg"), onPressed:() async=>_sendDataBack(context),),heightFactor:1.3),
      Container(
        padding:EdgeInsets.only(
    top: 7,
    left: 1,
    right: 1,
    bottom: 1
  ), 
     height: 300,
    child:Column(
     mainAxisSize: MainAxisSize.min,// To make the card compact
    children: <Widget>[
    
     SizedBox(height: 35),
     
     Row(
       children: <Widget>[
    Align(alignment: Alignment.bottomRight,child: IconButton(icon: SvgPicture.asset("assets/icons/gps.svg"), onPressed: null,),heightFactor:0.88),
    Align(alignment: Alignment.topRight,child:FlatButton(child:Text( mapdireccion,style:TextStyle(color: color4 ?kSecondaryColor:Colors.grey[700],fontWeight:FontWeight.bold )),onPressed:()=>_awaitReturnValueFromSecondScreen(context),
    ),heightFactor:1,widthFactor: 0.8,),
   ]
),
      SizedBox(height: 1),
     Container(color: Colors.grey, height: 1.5, width:169),
     
     SizedBox(
       height: 35,
       child:Row(
       children: <Widget>[
        
    Align(alignment: Alignment.topRight,child: IconButton(icon: SvgPicture.asset("assets/icons/pingps.svg"), onPressed: null,),heightFactor:1),
    Align(alignment: Alignment.topRight,child:Text( "Cra. 67A #95-80",style:TextStyle(color: color1?kSecondaryColor:Colors.grey[500],fontWeight:FontWeight.bold,fontSize: 12 )),heightFactor:0.9,widthFactor: 0.9,),
    Align(alignment: Alignment.topRight,child: Radio(
                  activeColor:kPrimaryColor,
                  value:list[0] ,
                  groupValue: _adressValue,
                  onChanged: (value) {
                    setState(() {
                      _adressValue = value;
                      color1=true;
                      color2=false;
                      color3=false;
                    });
                
                  },
                ),
                 widthFactor: 0.75,
              ),
          
  
     Align(alignment: Alignment.topRight,child: IconButton(icon: SvgPicture.asset("assets/icons/trashi.svg"), onPressed: null,),widthFactor: 0.6),

       ]

     ),
     ),
           
    Container(color: Colors.grey, height: 1.5, width:169),

     SizedBox(
       height: 35,
       child:Row(
       children: <Widget>[
        
    Align(alignment: Alignment.topRight,child: IconButton(icon: SvgPicture.asset("assets/icons/pingps.svg"), onPressed: null,),heightFactor:1),
    Align(alignment: Alignment.topRight,child:Text( "Tv 27. #57-81      ",style:TextStyle(color:  color2?kSecondaryColor:Colors.grey[500],fontWeight:FontWeight.bold,fontSize: 12 )),heightFactor:0.9,widthFactor: 0.91,),
      Align(alignment: Alignment.topRight,child:Radio(
                  activeColor:kPrimaryColor,
                  hoverColor:Colors.grey,
                  value: list[1],
                  groupValue: _adressValue,
                  onChanged: ( value) {

                    setState(() {
                      _adressValue = value;
          
                      color1=false;
                      color2=true;
                      color3=false;
                    }
                    
                    
                    );

               
                  },
                ),
                widthFactor: 0.75,
              ),
            
  
    Align(alignment: Alignment.topRight,child: IconButton(icon: SvgPicture.asset("assets/icons/trashi.svg"), onPressed: null,),widthFactor: 0.6),

       ]

     ),
     ),
       Container(color: Colors.grey, height: 1.5, width:169),
      
    SizedBox(
       height: 35,
       child:Row(
       children: <Widget>[
        
    Align(alignment: Alignment.topRight,child: IconButton(icon: SvgPicture.asset("assets/icons/pingps.svg"), onPressed: null,),heightFactor:1),
    Align(alignment: Alignment.topRight,child:Text( "  Calle 86A.#67-89",style:TextStyle(color: color3?kSecondaryColor:Colors.grey[500],fontWeight:FontWeight.bold ,fontSize: 11.5)),heightFactor:0.9,widthFactor: 0.83,),
    Align(alignment: Alignment.topRight,child: Radio(activeColor:kPrimaryColor,value: list[2],groupValue: _adressValue,onChanged: (value) {setState(() {_adressValue = value;
    
                      color1=false;
                      color2=false;
                      color3=true;});},),widthFactor: 0.76),
             
    
     Align(alignment: Alignment.topRight,child: IconButton(icon: SvgPicture.asset("assets/icons/trashi.svg"), onPressed: null,),widthFactor: 0.58),

       ]

     ),
     ),
      Container(color: Colors.grey, height: 1.5, width:169),
      Align(alignment: Alignment.center,child:FlatButton(
      child: Text(
        'Agregar/Editar Direccion',
        style: TextStyle(
            color:kPrimaryColor, decoration: TextDecoration.underline,fontSize: 11,fontWeight:FontWeight.bold),
      ),
      onPressed: () async {
       
      },
    ),
    heightFactor:0.65,
      ),
      
   
    ],
  ),
      ),

],
),

);
}
 

    void _sendDataBack(BuildContext context) {
    String textToSendBack = _adressValue;
    Navigator.pop(context, textToSendBack);
  }
     void _awaitReturnValueFromSecondScreen(BuildContext context) async {

    // start the SecondScreen and wait for it to finish with a result
final result = await showDialog(context: context,builder: (buildcontext) => Mapscreen(),barrierDismissible: false,);

  
   
    setState(() {
      mapdireccion = result;
      _adressValue = mapdireccion;
          
      color1=false;
      color2=false;
      color3=false;
      color4=true;
    });
   }
}






