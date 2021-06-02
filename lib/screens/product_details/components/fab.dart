import 'package:masdamas/constants.dart';
import 'package:masdamas/services/authentification/authentification_service.dart';
import 'package:masdamas/services/database/user_database_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:logger/logger.dart';
import 'package:masdamas/size_config.dart';

import '../../../utils.dart';

class AddToCartFAB extends StatelessWidget {
  const AddToCartFAB({
    Key key,
    @required this.productId,
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
              await UserDatabaseHelper().addProductToCart(productId);
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
      child: Container(
            decoration: BoxDecoration(
              color: kSecondaryColor,
              shape: BoxShape.rectangle,
              border: Border.all(color: kSecondaryColor, width: 1.5),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric( horizontal: getProportionateScreenWidth(19), vertical: getProportionateScreenHeight(5)),
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  Text(
                    'CARRITO',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      color: Colors.white)
                  )
                ],
              ),
            ),
          ),
      
    );
  }
}
