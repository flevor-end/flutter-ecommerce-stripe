import 'package:flutter/material.dart';
import 'package:flutter_mobile_carousel/carousel.dart';
import 'package:flutter_mobile_carousel/carousel_arrow.dart';
import 'package:flutter_mobile_carousel/default_carousel_item.dart';

import '../constants.dart';
import '../sizec.dart';
import 'custom_bottom_navbar.dart';


class Compart extends StatefulWidget {


  @override
   CompartState createState() => CompartState();
}

class  CompartState extends State <Compart> {
    int _currentIndex=0;

  List  widgetList=[
    Item(),
    Item(),
    Item(),
    Item(),
    Item(),
    Item(),
    Item(),
    Item(),
  ];

 
  @override
  Widget build(BuildContext context) {
  return SafeArea(
          child: Scaffold(

        body:SingleChildScrollView(
              child: Column(children: [
              SizedBox(height: 15,),
              Container(
              height: 33,
              width: Sizec.screenWidth,
              decoration: BoxDecoration(
                color: kSecondaryColor
              ),
                
          child: Row(children: [
          IconButton(
          padding:EdgeInsets.all(4.0),
          alignment: Alignment.topCenter,
          icon:Icon(Icons.arrow_back_ios),color: Colors.white,
          onPressed: (){ Navigator.pop(context);},
          iconSize: 25,
      ),
Align(child: Text("AGREGAR",style:TextStyle(color:Colors.white,fontSize: 18,fontWeight:FontWeight.bold )),widthFactor: Sizec.screenWidth/115,),
],),),
SizedBox(height: 18,),
Text("PERSONAS CERCA DE TI",style:TextStyle(color: kSecondaryColor,fontSize: 16,fontWeight:FontWeight.bold )),
SizedBox(height: 15,),
this.renderCarouselWithArrows(),
SizedBox(height: 15,),
Text("BUSCAR CONTACTO ",style:TextStyle(color: kSecondaryColor,fontSize: 16,fontWeight:FontWeight.bold )),
Padding(
  padding: const EdgeInsets.only(left:15,right:15,top: 12, bottom: 12),
  child:   Container(
    height: 40,
    child: TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
          hintText: "Escribe el nombre del contacto MASDAMAS",
              hintStyle:TextStyle(fontSize: 12),
  
          border: OutlineInputBorder()
      )
    ),
  ),
),

Item1(),
Item1(),
Item1(),
Item1(),
OutlinedButton(onPressed: () {  },
child: Text("VER TODOS LOS RESULTADOS",style: TextStyle(
color: Color(0xff0E2D4F),
decoration: TextDecoration.underline,
fontSize: 10),),),
  SizedBox(height: 10,),    
 MaterialButton(   shape: RoundedRectangleBorder(
  ),
padding: EdgeInsets.only(left:20,right: 20,top: 13,bottom: 13),
color: kSecondaryColor,
onPressed: () {  },
child: Text('SINCRONIZAR CONTACTOS',
style: TextStyle(color: Colors.white, fontSize: 14)),)
]
),
),
bottomNavigationBar: CustomBottomNavBar(color: false,color2: false,color3: false,),
),
);
   
   
       
  }
  renderCarouselWithArrows() {
    const double ARROW_WIDTH = 20.0;
    const double ARROW_ICON_SIZE = 25.0;

    return Column(
      children: <Widget>[
        Carousel(
          rowCount: 4,
          leftArrow: CarouselArrow(
            width: ARROW_WIDTH,
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.chevron_left,
                size: ARROW_ICON_SIZE,
              ),
            ),
          ),
          rightArrow: CarouselArrow(
            width: ARROW_WIDTH,
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.chevron_right,
                size: ARROW_ICON_SIZE,
              ),
            ),
          ),
          onDragStart: (DragStartDetails details) {},
          onDrag: (DragUpdateDetails details) {},
          onDragEnd: (DragEndDetails details) {},
          children: this.widgetList.map<Widget>((result) {
            return result;
          }).toList(),
        ),
      ],
    );
  }
}

class Item extends StatelessWidget {
  const Item({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         CircleAvatar(
                
                radius: 18.0,
                 backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/masdamas-49803.appspot.com/o/Copia%20de%20usuario.png?alt=media&token=1f391c7c-97cb-44e8-910e-cad3fcb4a867"),
              ),
          Text(
            "Nombre",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
              fontWeight: FontWeight.w600
            )
          ),
             Text(
            "3.1 km ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 11.0,
              fontWeight: FontWeight.w600
            )
          ),
          Align(
               heightFactor:0.97,
              child:  Container(
              width: 80,
              height: 20,
              child: FlatButton(
                child: Text('AGREGAR',style: TextStyle(fontSize: 9.9),),
                color: kSecondaryColor,
                textColor: Colors.white,
                onPressed: () {},
              ),
                 ),
            ),
        ],
      
    );
  }
}
class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          SizedBox(width: 15,),
         CircleAvatar(
                
                radius: 18.0,
                 backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/masdamas-49803.appspot.com/o/Copia%20de%20usuario.png?alt=media&token=1f391c7c-97cb-44e8-910e-cad3fcb4a867"),
              ),
              SizedBox(width: 15,),
          Text(
            "Nombre y Apellido",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.bold
            )
          ),
          SizedBox(width: 75,),
              MaterialButton(   height:23,shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
        ),
        color: kSecondaryColor,
        onPressed: () {  },
        child: Text('AGREGAR',
        style: TextStyle(color: Colors.white, fontSize: 11)),)
        ],
      
    );
  }
}

  