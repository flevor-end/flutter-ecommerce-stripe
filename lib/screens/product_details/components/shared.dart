import 'package:masdamas/constants.dart';
import 'package:masdamas/models/Product.dart';
import 'package:masdamas/screens/checkout/checkout_screen.dart';
import 'package:masdamas/services/authentification/authentification_service.dart';
import 'package:masdamas/services/database/user_database_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:logger/logger.dart';
import 'package:masdamas/size_config.dart';

import '../../../utils.dart';

class AddToShared extends StatelessWidget {
  const AddToShared({
    Key key,
    @required this.productId
  }) : super(key: key);

  final String productId;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        
        bool allowed = AuthentificationService().currentUserVerified;
        if (!allowed) {
          final reverify = await showConfirmationDialog(context,
              "No ha verificado su dirección de correo electrónico. Esta acción solo está permitida para usuarios verificados.",
              positiveResponse: "Reenviar verificación",
              negativeResponse: "Regresar");
          if (reverify) {
            final future =
                AuthentificationService().sendVerificationEmailToCurrentUser();
            await showDialog(
              context: context,
              builder: (context) {
                return FutureProgressDialog(
                  future,
                  message: Text("Reenviando verificación"),
                );
              },
            );
          }
          
          return;
        }
        bool addedSuccessfully = false;
        String snackbarMessage;
        try {
          addedSuccessfully =
              await UserDatabaseHelper().addProductToCompartido(productId);
          if (addedSuccessfully == true) {
            snackbarMessage = "Producto agregado exitosamente";
          } else {
            throw "No se pudo agregar el producto por una razón desconocida";
          }
        } on FirebaseException catch (e) {
          Logger().w("Firebase Exception: $e");
          snackbarMessage = "Something went wrong";
        } catch (e) {
          Logger().w("Unknown Exception: $e");
          snackbarMessage = "Something went wrong";
        } finally {
          Logger().i(snackbarMessage);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(snackbarMessage),
            ),
          );
        }
      },
      
      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Checkout(),));
                    },
                      child: Container(
                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30), vertical: getProportionateScreenWidth(10) ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                        color: kShopColor
                      ),
                      child: Text.rich(
                        TextSpan(
                          text: "\$123456 \n",
                          style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                          children: [
                            TextSpan(
                              text: " PRECIO UNIDOS",
                              style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                          ),
                              
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center
                      ),
                    ),
                  ),
      
    );
  }
}
