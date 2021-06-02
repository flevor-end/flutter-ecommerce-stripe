



import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masdamas/components/custom_bottom_navbar.dart';
import 'package:masdamas/screens/home/components/home_header.dart';
import '../../constants.dart';
import '../../sizec.dart';



class CrearGrups extends StatefulWidget {
  static String routeName = 'index_grupos';
  @override
  _CrearGrupsState createState() => _CrearGrupsState();
}

class _CrearGrupsState extends State<CrearGrups> {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    int _radioValue = 0;


 @override
  void initState() {
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
  
    return  SafeArea(
        
        child: Scaffold(
               appBar: AppBar(
        iconTheme: IconThemeData(
          color: kSecondaryColor,
        ),
        flexibleSpace: HomeHeader(),
        leading: Container(),
      ),
                  body: SingleChildScrollView(
                  child:Form(
                 key: _formkey,
               child: Column(
              children: [
                SizedBox(height: 15,),
          Padding(
              padding: const EdgeInsets.only(left:7,right:7),
              child: Container(
              height: 30,
              width: Sizec.screenWidth,
              decoration: BoxDecoration(
           
               border: Border.all(width: 2, color:kPrimaryColor),
              borderRadius: BorderRadius.circular(6),
              ),    
        child: Row(children: [
        IconButton(
        padding:EdgeInsets.all(1.0),
        alignment: Alignment.topCenter,
        icon:Icon(Icons.arrow_back_ios),color: kSecondaryColor,
        onPressed: (){ Navigator.pop(context);},
        iconSize: 23,
      ),
  Align(child: Text("CREAR GRUPO",style:TextStyle(color:kSecondaryColor,fontSize: 15,fontWeight:FontWeight.w600 )),widthFactor:  Sizec.screenWidth/155),
],),),
),
 SizedBox(height: 12,),
 Align(child: Text("COMPLETA LA SIGUIENTE INFORMACION",style:TextStyle(color:kPrimaryColor,fontSize: 15,fontWeight:FontWeight.w600 )),widthFactor:  Sizec.screenWidth/140),
SizedBox(height: 3,),
Padding(
  padding: const EdgeInsets.all(9.0),
  child:   TextField(
  decoration: new InputDecoration(
  enabledBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: BorderSide(
  color: kSecondaryColor,
  width: 1.5,
        ),
      ),
  focusedBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: BorderSide(
  color:kSecondaryColor,
          width: 1.5,
        ),
      ),
   hintText: 'Nombre del grupo',
   ),
            ),
),
          
Padding(
  padding: const EdgeInsets.all(9.0),
  child:   TextField(
              decoration: new InputDecoration(
                enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: kSecondaryColor,
          width: 1.5,
        ),
      ),
                focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color:kSecondaryColor,
          width: 1.5,
        ),
      ),
                 
                  hintText: 'Descripcion del grupo',
                
                ),
            ),
),
SizedBox(height: 12,),
 Align(child: Text("¿SOLICITAR PERMISOS DE LOS ADMINISTRADOR PARA UNIRSE?",style:TextStyle(color:kSecondaryColor,fontSize: 11,fontWeight:FontWeight.w600 )),widthFactor:  Sizec.screenWidth/140),
 
  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: null,
                    ),
                    new Text(
                      'Si',
                      style: new TextStyle(fontSize: 13.0),
                    ),
                    SizedBox(width:10,),
                    new Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: null,
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 13.0,
                      ),
                    ),
                  
                  ],
                ),
 Align(child: Text("¿PUEDENLOS MIEMBROS SUBIR CONTENIDO AL GRUPO?",style:TextStyle(color:kSecondaryColor,fontSize: 11,fontWeight:FontWeight.w600 )),widthFactor:  Sizec.screenWidth/140),
 
   Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: null,
                    ),
                    new Text(
                      'Si',
                      style: new TextStyle(fontSize: 13.0),
                    ),
                    SizedBox(width:10,),
                    new Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: null,
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 13.0,
                      ),
                    ),
                  
                  ],
                ),
 Align(child: Text("¿DESEAS HABILITAR UN CHAT PARA EL GRUPO?",style:TextStyle(color:kSecondaryColor,fontSize: 11,fontWeight:FontWeight.w600 )),widthFactor:  Sizec.screenWidth/140),

   Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: null,
                    ),
                    new Text(
                      'Si',
                      style: new TextStyle(fontSize: 13.0),
                    ),
                    SizedBox(width:10,),
                    new Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: null,
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 13.0,
                      ),
                    ),
                  
                  ],
                ),
 Align(child: Text("AÑADE UNA FOTO PARA TU GRUPO ",style:TextStyle(color:kPrimaryColor,fontSize: 15,fontWeight:FontWeight.w600 )),widthFactor:  Sizec.screenWidth/140),
 SizedBox(height: 12,),
 CircleAvatar(radius: 40,backgroundColor: Colors.grey,),
SizedBox(height: 14,),
 Padding(
   padding: const EdgeInsets.only(left:6,right:6),
   child: Align(child: Text("REGLAS DE LOS ADMINISTRADORES DEL GRUPO",style:TextStyle(color:kPrimaryColor,fontSize: 14,fontWeight:FontWeight.bold )),widthFactor:  Sizec.screenWidth/140),
 ),  
 SizedBox(height: 8),
 Padding(
   padding: const EdgeInsets.all(10.0),
   child: Text("1.Se amable y cordial para crear un entorno agradable debemos tratarnos con respeto.puedes debatir sobre diversos asuntos siempre que seas cordial con los demas ",style:TextStyle(color:Colors.black,fontSize: 11,fontWeight:FontWeight.w600 )),
 ),
 Padding(
   padding: const EdgeInsets.all(10.0),
   child: Text("2.No hagas bullying ni uses lenguaje ofensivo asegurate de que todos se sientan seguros.No se permite el bullying ni los comentarios degradantes sobre raza,religion,cultura,orientacion sexual,genero o identidad.No publiques promociones o spam",style:TextStyle(color:Colors.black,fontSize: 11,fontWeight:FontWeight.w600 )),
 ),
  Padding(
   padding: const EdgeInsets.all(10.0),
   child: Text("3.Da mas de lo que recibes.En este grupo no se permiten la autopromocion, el spam ylos enlaces irrelevantes.Respeta la privacidad de los demas  ",style:TextStyle(color:Colors.black,fontSize: 11,fontWeight:FontWeight.w600 )),
 ),
   Padding(
   padding: const EdgeInsets.all(10.0),
   child: Text("4.Para formar parte del grupo se requiere confianza mutua.Las conversaciones sinceras y abiertas no dejan de ser confidenciales y privadas.Lo que se comparte en el grupo no debe salir de el",style:TextStyle(color:Colors.black,fontSize: 11,fontWeight:FontWeight.w600 )),
 ) ,
SizedBox(height: 15,),
 Padding(
      padding: EdgeInsets.only(left: 15,right: 1),
      child: CheckboxListTile(
        activeColor: kPrimaryColor,
        title: FlatButton(
      child: Text(
        'Acepto la ley de proteccion de datos personales que reconoce y protege el derecho que tienen todas las personas al conocer',
         textAlign:TextAlign.start,
        style: TextStyle(
            color: Colors.black,
            fontSize: 11),
      ),
      onPressed: () {},
    ),// The named parameter 'title' isn't defined.
        value: true,
        onChanged: (newValue) {},
        controlAffinity:
            ListTileControlAffinity.leading, //  <-- leading Checkbox
      ),
    ),  
    SizedBox(height: 15,),
        Container(
           padding: EdgeInsets.only(left: 4,right:2),
           child: SizedBox(
      width: Sizec.screenWidth/2.11,
      height: getProportionateScreenHeight(42),
      child: FlatButton(
        color: kSecondaryColor,
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
              ),
        onPressed: (){},
        child:  
                  Text(
                    "CREAR GRUPO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                
              ),
      ),
    ),
  SizedBox(height: 25,),                    
                          
              ],
            ),
                  ),
          ),
bottomNavigationBar:CustomBottomNavBar(color: false,color2: true,color3: false,),
        ),
      );
    
  }
  
}

 class BtnGrupos extends StatelessWidget {
   const BtnGrupos({
     Key key,
    this.text,
    this.press,
    this.image,
    this.width,
    this.letra
   }) : super(key: key);

   final String text,image;
   final Function press;
   final double width,letra;

  @override
   Widget build(BuildContext context) {
     return  Container(
           padding: EdgeInsets.only(left: 4,right:2),
           child: SizedBox(
      width: Sizec.screenWidth/2.11,
      height: getProportionateScreenHeight(42),
      child: FlatButton(
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
              side: BorderSide(width: 1.5, color: kSecondaryColor)),
        onPressed: press,
        child:  Row(
                children: <Widget>[
                  Container(
                    height: 23,

                    child: SvgPicture.asset(
                      image,
                      width: 30,
                    ),
                  ),
                  SizedBox(width:width),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: letra,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
      ),
    ),
         );
   }

 }



class ItemG extends StatelessWidget {
  const ItemG({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         CircleAvatar(
                
                radius: 18.0,
                 backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/masdamas-49803.appspot.com/o/Captura%20de%20Pantalla%202021-05-21%20a%20la(s)%2010.50.40%20a.%C2%A0m..png?alt=media&token=56a051d8-e27f-4ef6-859b-3c42eddc7f3c"),
              ),
          Text(
            "Nombre de Grupo ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
              fontWeight: FontWeight.w600
            )
          ),
        ],
      
    );
  }
}