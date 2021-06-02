import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:masdamas/blocs/bloc_use.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/screens/home/home.screen.dart';
import 'package:masdamas/screens/sign_up/registro_exitoso.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



class Codigoerror  extends  StatefulWidget{
  static String routeName = 'codigoerror';
  Codigoerror({Key key ,this.numero}) : super(key: key);

  final String numero;
     @override
  CodigoerrorState createState() =>  CodigoerrorState();
}

class CodigoerrorState extends State <Codigoerror> {
  String error;
  FirebaseAuth _auth=FirebaseAuth.instance;
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";
  bool hasError = false;
  String currentText = "";
  StreamController<ErrorAnimationType> errorController;
  UserBloc userBloc;
  @override
  void initState() {
  super.initState();  
  loginUser2("",context); 
  }

  

 Future<void> loginUser2(String phone, BuildContext context) async{
 
   
   
    _auth.verifyPhoneNumber(
        phoneNumber:phone,
        timeout: Duration(seconds:20),
        verificationCompleted: (PhoneAuthCredential credential) async{
        Navigator.of(context).pop();
        var result = await _auth.currentUser.linkWithCredential(credential) ;
        User user = result.user;
          if(user != null){
               Fluttertoast.showToast(
                    msg: "Bienvenido a MASDAMAS a registrado su telefono con exito",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: kPrimaryColor,
                    textColor: Colors.white,
                    fontSize: 20.0);
            Navigator.pushNamedAndRemoveUntil(context,
         HomeScreen.routeName, (Route<dynamic> route) => false);
          }else{
            print("Error");
          }
        },
        verificationFailed: (exception){
            showDialog(
                context: context,
            barrierDismissible: false,
            builder: (context) {
              userBloc = BlocProvider.of(context);
              return Dialog(
               
               child:
               
         Padding(
                    padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 35),
                    child:Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("INGRESE NUMERO DE TELEFONO",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold ),textAlign:TextAlign.center,),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          autofocus: true,
                         keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1.6, color: Color(0xff0E2D4F)),
          ),
                            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1.6, color: Color(0xff0E2D4F)),
          ),
                           
                            hintText: "Numero de Telefono"

                        ),
                        controller: _phoneController,
                      ),
                    ),

                  
                     SizedBox(height: 20,),

                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        child: Text("Verificar"),
                        textColor: Colors.white,
                        padding: EdgeInsets.all(13),
                         shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10),
                      ),
                        onPressed: () {
                          final phone = _phoneController.text.trim();
                          loginUser2("+57$phone",context);
                        

                        },
                        color: kPrimaryColor,
                      ),
                    ),

                         SizedBox(height: 10,),
                        Container(
                      width: double.infinity,
                      child: FlatButton(
                        child: Text("Volver a Inicio"),
                        textColor: Colors.white,
                        padding: EdgeInsets.all(13),
                         shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10),
                      ),
                        onPressed: () {
                        userBloc.signOut();
                        Phoenix.rebirth(context);
                        },
                        color: kPrimaryColor,
                      ),
                    )


                ]


               ) ,
                ),
              );}
            );



        },
        codeSent: (String verificationId, int resendToken){
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Dialog(
          child: Container(
            width: 1000,
            padding: EdgeInsets.all(10),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                   Column(
        
        children: [
         
         Text("INGRESE CODIGO ENVIADO POR MENSAJE DE TEXTO AL ${phone.substring(9)}",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold ),textAlign:TextAlign.center,),
         SizedBox(height: 30,),
         Form(
            
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 10),
                    child: PinCodeTextField(
                      autoFocus : true,
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText:false,
                      obscuringCharacter: '*',
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v.length < 3) {
                          return "INGRESA CODIGO";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor:
                            hasError ? Colors.orange : Colors.white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: _codeController,
                      keyboardType: TextInputType.number,
                      boxShadows: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v)async {
                      final code = _codeController.text;
                      AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);
                    try{ var result = await _auth.currentUser.linkWithCredential(credential) ;
                     User user = result.user;
                    if(user != null){
                    Fluttertoast.showToast(
                    msg: "Bienvenido a MASDAMAS a Registrado su numero de telefono con exito",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: kPrimaryColor,
                    textColor: Colors.white,
                    fontSize: 20.0);
                    Navigator.pushNamedAndRemoveUntil(context,
                   HomeScreen.routeName, (Route<dynamic> route) => false);
                    }
                    }catch(e){
                     switch (e.code) {
                       
                  case "session-expired":
                          error = 'Sesion expirada vuelva a aunteticar su telefono';
                         Fluttertoast.showToast(
                        msg: error,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor:kPrimaryColor,
                        textColor: Colors.white,
                        fontSize: 20);
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Codigoerror()));
                    break;
                  case "invalid-verification-code":
                    error = 'Codigo Erroneo';
                    Fluttertoast.showToast(
                        msg: error,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor:kPrimaryColor,
                        textColor: Colors.white,
                        fontSize:24);
                    break;
                    case "object-not-found":
                    error = 'Complete su Registro';
                    Fluttertoast.showToast(
                        msg: error,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: kSecondaryColor,
                        textColor: Colors.white,
                        fontSize: 20);
                        break;
                  default:
                    print(e);
  
                    break;
                }

                      
                    }
                      },
                       onTap: () {
                       
                      },
                      onChanged: (value) {
                      
                       },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),
              ),

      ],),

                ],
              ),
            ),
          ),
              
        );
            }
          );
        },
        codeAutoRetrievalTimeout: (String verificationID) {
       
        },
      
 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      leading: Container(),
      title: Text("Confirmar identidad"),   

        ),
        
        
    );
  }
}