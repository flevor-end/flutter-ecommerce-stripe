import 'package:masdamas/components/top_rounded_container.dart';
import 'package:masdamas/constants.dart';
import 'package:masdamas/models/Product.dart';
import 'package:masdamas/screens/product_details/provider_models/ProductActions.dart';
import 'package:masdamas/services/authentification/authentification_service.dart';
import 'package:masdamas/services/database/user_database_helper.dart';
import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
import '../../../utils.dart';
import 'producto_descripcion.dart';

class ProductActionsSection extends StatelessWidget {
  final Product product;

  const ProductActionsSection({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final column = Column(
      children: [
        Stack(
          children: [
            TopRoundedContainer(
              child: ProductoDescripcion(product: product),
            ),
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: FavouriteButtom(product: product),
            // ),
          ],
        ),
      ],
    );
    UserDatabaseHelper().isProductFavourite(product.id).then(
      (value) {
        final productActions =
            Provider.of<ProductActions>(context, listen: false);
        productActions.productFavStatus = value;
      },
    ).catchError(
      (e) {
        Logger().w("$e");
      },
    );
    return column;
  }
}

class FavouriteButtom extends StatelessWidget {
  const FavouriteButtom({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductActions>(
      builder: (context, productDetails, child) {
        return InkWell(
          onTap: () async {
            bool allowed = AuthentificationService().currentUserVerified;
            if (!allowed) {
              final reverify = await showConfirmationDialog(context,
                  "No ha verificado su dirección de correo electrónico. Esta acción solo está permitida para usuarios verificados.",
                  positiveResponse: "Reenviar verificación",
                  negativeResponse: "Regresar");
              if (reverify) {
                final future = AuthentificationService()
                    .sendVerificationEmailToCurrentUser();
                await showDialog(
                  context: context,
                  builder: (context) {
                    return FutureProgressDialog(
                      future,
                      message: Text("Reenviando Correo de Verificacion"),
                    );
                  },
                );
              }
              return;
            }
            bool success = false;
            final future = UserDatabaseHelper()
                .switchProductFavouriteStatus(
                    product.id, !productDetails.productFavStatus)
                .then(
              (status) {
                success = status;
              },
            ).catchError(
              (e) {
                Logger().e(e.toString());
                success = false;
              },
            );
            await showDialog(
              context: context,
              builder: (context) {
                return FutureProgressDialog(
                  future,
                  message: Text(
                    productDetails.productFavStatus
                        ? "Eliminando de Favoritos"
                        : "Agregando a Favoritos",
                  ),
                );
              },
            );
            if (success) {
              productDetails.switchProductFavStatus();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: productDetails.productFavStatus
                  ? Color(0xFFFFE6E6)
                  : Color(0xFFF5F6F9),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10) ),
            border: Border.all(color: kSecondaryColor, width: 1.5),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric( horizontal: getProportionateScreenWidth(16), vertical: getProportionateScreenHeight(4.5)),
              child: Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: productDetails.productFavStatus
                        ? Color(0xFFFF4848)
                        : kSecondaryColor,
                  ),
                  Text(
                    'ME GUSTA',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      color: productDetails.productFavStatus
                        ? Color(0xFFFF4848)
                        : kSecondaryColor,)
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
