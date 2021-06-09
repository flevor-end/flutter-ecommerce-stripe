import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:masdamas/components/default_button.dart';
import 'package:masdamas/exceptions/local_files_handling/image_picking_exceptions.dart';
import 'package:masdamas/exceptions/local_files_handling/local_file_handling_exception.dart';
import 'package:masdamas/models/Product.dart';
import 'package:masdamas/screens/edit_product/provider_models/ProductDetails.dart';
import 'package:masdamas/services/database/product_database_helper.dart';
import 'package:masdamas/services/firestore_files_access/firestore_files_access_service.dart';
import 'package:masdamas/services/local_files_access/local_files_access_service.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class EditProductForm extends StatefulWidget {
  final Product product;
  EditProductForm({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  _EditProductFormState createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  final _basicDetailsFormKey = GlobalKey<FormState>();
  final _describeProductFormKey = GlobalKey<FormState>();
  final _tagStateKey = GlobalKey<TagsState>();

  final TextEditingController titleFieldController = TextEditingController();
  final TextEditingController variantFieldController = TextEditingController();
  final TextEditingController discountPriceFieldController =
      TextEditingController();
  final TextEditingController originalPriceFieldController =
      TextEditingController();
  final TextEditingController highlightsFieldController =
      TextEditingController();
  final TextEditingController desciptionFieldController =
      TextEditingController();
  final TextEditingController sellerFieldController = TextEditingController();

  bool newProduct = true;
  Product product;

  @override
  void dispose() {
    titleFieldController.dispose();
    variantFieldController.dispose();
    discountPriceFieldController.dispose();
    originalPriceFieldController.dispose();
    highlightsFieldController.dispose();
    desciptionFieldController.dispose();
    sellerFieldController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.product == null) {
      product = Product(null);
      newProduct = true;
    } else {
      product = widget.product;
      newProduct = false;
      final productDetails =
          Provider.of<ProductDetails>(context, listen: false);
      productDetails.initialSelectedImages = widget.product.images
          .map((e) => CustomImage(imgType: ImageType.network, path: e))
          .toList();
      productDetails.initialSelectedImages = widget.product.imagesColor
          .map((e) => CustomImage(imgType: ImageType.network, path: e))
          .toList();
      productDetails.initialProductType = product.productType;
      productDetails.initSearchTags = product.searchTags ?? [];
    }
  }

  

  @override
  Widget build(BuildContext context) {
    final column = Column(
      children: [
        buildBasicDetailsTile(context),
        SizedBox(height: getProportionateScreenHeight(10)),
        buildDescribeProductTile(context),
        SizedBox(height: getProportionateScreenHeight(10)),
        buildUploadImagesTile(context),
        SizedBox(height: getProportionateScreenHeight(20)),
        buildUploadImagesColorTile(context),
        SizedBox(height: getProportionateScreenHeight(20)),
        buildProductTypeDropdown(),
        SizedBox(height: getProportionateScreenHeight(20)),
        buildProductSearchTagsTile(),
        SizedBox(height: getProportionateScreenHeight(80)),
        DefaultButton(
            text: "Guardar Producto",
            press: () {
              saveProductButtonCallback(context);
            }),
        SizedBox(height: getProportionateScreenHeight(10)),
      ],
    );
    if (newProduct == false) {
      titleFieldController.text = product.title;
      variantFieldController.text = product.variant;
      discountPriceFieldController.text = product.discountPrice.toString();
      originalPriceFieldController.text = product.originalPrice.toString();
      highlightsFieldController.text = product.highlights;
      desciptionFieldController.text = product.description;
      sellerFieldController.text = product.seller;
    }
    return column;
  }

  Widget buildProductSearchTags() {
    return Consumer<ProductDetails>(
      builder: (context, productDetails, child) {
        return Tags(
          key: _tagStateKey,
          horizontalScroll: true,
          heightHorizontalScroll: getProportionateScreenHeight(80),
          textField: TagsTextField(
            lowerCase: true,
            width: getProportionateScreenWidth(120),
            constraintSuggestion: true,
            hintText: "Agregar etiqueta de búsqueda",
            keyboardType: TextInputType.name,
            onSubmitted: (String str) {
              productDetails.addSearchTag(str.toLowerCase());
            },
          ),
          itemCount: productDetails.searchTags.length,
          itemBuilder: (index) {
            final item = productDetails.searchTags[index];
            return ItemTags(
              index: index,
              title: item,
              active: true,
              activeColor: kPrimaryColor,
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              alignment: MainAxisAlignment.spaceBetween,
              removeButton: ItemTagsRemoveButton(
                backgroundColor: Colors.white,
                color: kTextColor,
                onRemoved: () {
                  productDetails.removeSearchTag(index: index);
                  return true;
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget buildBasicDetailsTile(BuildContext context) {
    return Form(
      key: _basicDetailsFormKey,
      child: ExpansionTile(
        maintainState: true,
        title: Text(
          "Detalles Basicos",
          style: Theme.of(context).textTheme.headline6,
        ),
        leading: Icon(
          Icons.shop,
        ),
        childrenPadding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
        children: [
          buildTitleField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildVariantField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildOriginalPriceField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildDiscountPriceField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildSellerField(),
          SizedBox(height: getProportionateScreenHeight(20)),
        ],
      ),
    );
  }

  bool validateBasicDetailsForm() {
    if (_basicDetailsFormKey.currentState.validate()) {
      _basicDetailsFormKey.currentState.save();
      product.title = titleFieldController.text;
      product.variant = variantFieldController.text;
      product.originalPrice = double.parse(originalPriceFieldController.text);
      product.discountPrice = double.parse(discountPriceFieldController.text);
      product.seller = sellerFieldController.text;
      return true;
    }
    return false;
  }

  Widget buildDescribeProductTile(BuildContext context) {
    return Form(
      key: _describeProductFormKey,
      child: ExpansionTile(
        maintainState: true,
        title: Text(
          "Descripción Producto",
          style: Theme.of(context).textTheme.headline6,
        ),
        leading: Icon(
          Icons.description,
        ),
        childrenPadding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
        children: [
          buildHighlightsField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildDescriptionField(),
          SizedBox(height: getProportionateScreenHeight(20)),
        ],
      ),
    );
  }

  bool validateDescribeProductForm() {
    if (_describeProductFormKey.currentState.validate()) {
      _describeProductFormKey.currentState.save();
      product.highlights = highlightsFieldController.text;
      product.description = desciptionFieldController.text;
      return true;
    }
    return false;
  }

  Widget buildProductTypeDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: kTextColor, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(28)),
      ),
      child: Consumer<ProductDetails>(
        builder: (context, productDetails, child) {
          return DropdownButton(
            value: productDetails.productType,
            items: ProductType.values
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      EnumToString.convertToString(e),
                    ),
                  ),
                )
                .toList(),
            hint: Text(
              "Elija el tipo de producto",
            ),
            style: TextStyle(
              color: kTextColor,
              fontSize: 16,
            ),
            onChanged: (value) {
              productDetails.productType = value;
            },
            elevation: 0,
            underline: SizedBox(width: 0, height: 0),
          );
        },
      ),
    );
  }

  Widget buildProductSearchTagsTile() {
    return ExpansionTile(
      title: Text(
        "Etiquetas de búsqueda",
        style: Theme.of(context).textTheme.headline6,
      ),
      leading: Icon(Icons.check_circle_sharp),
      childrenPadding:
          EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
      children: [
        Text("Se buscará su producto para estas etiquetas"),
        SizedBox(height: getProportionateScreenHeight(15)),
        buildProductSearchTags(),
      ],
    );
  }

  Widget buildUploadImagesTile(BuildContext context) {
    return ExpansionTile(
      title: Text(
        "Subir Imagenes",
        style: Theme.of(context).textTheme.headline6,
      ),
      leading: Icon(Icons.image),
      childrenPadding:
          EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconButton(
              icon: Icon(
                Icons.add_a_photo,
              ),
              color: kTextColor,
              onPressed: () {
                addImageButtonCallback();
              }),
        ),
        Consumer<ProductDetails>(
          builder: (context, productDetails, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  productDetails.selectedImages.length,
                  (index) => SizedBox(
                    width: 80,
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          addImageButtonCallback(index: index);
                        },
                        child: productDetails.selectedImages[index].imgType ==
                                ImageType.local
                            ? Image.memory(
                                File(productDetails.selectedImages[index].path)
                                    .readAsBytesSync())
                            : Image.network(
                                productDetails.selectedImages[index].path),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

    Widget buildUploadImagesColorTile(BuildContext context) {
    return ExpansionTile(
      title: Text(
        "Subir Imagenes Colores",
        style: Theme.of(context).textTheme.headline6,
      ),
      leading: Icon(Icons.image),
      childrenPadding:
          EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconButton(
              icon: Icon(
                Icons.add_a_photo,
              ),
              color: kTextColor,
              onPressed: () {
                addImageButtonCallback();
              }),
        ),
        Consumer<ProductDetails>(
          builder: (context, productDetails, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  productDetails.selectedImages.length,
                  (index) => SizedBox(
                    width: 80,
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          addImageButtonCallback(index: index);
                        },
                        child: productDetails.selectedImages[index].imgType ==
                                ImageType.local
                            ? Image.memory(
                                File(productDetails.selectedImages[index].path)
                                    .readAsBytesSync())
                            : Image.network(
                                productDetails.selectedImages[index].path),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget buildTitleField() {
    return TextFormField(
      controller: titleFieldController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Samsung Galaxy F41 Mobile",
        labelText: "Nombre del Producto",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (_) {
        if (titleFieldController.text.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildVariantField() {
    return TextFormField(
      controller: variantFieldController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Fusion Green",
        labelText: "Variantes",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (_) {
        if (variantFieldController.text.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildHighlightsField() {
    return TextFormField(
      controller: highlightsFieldController,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText:
            "RAM: 4GB | Front Camera: 30MP | Rear Camera: Quad Camera Setup",
        labelText: "Caracteristicas",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (_) {
        if (highlightsFieldController.text.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: null,
    );
  }

  Widget buildDescriptionField() {
    return TextFormField(
      controller: desciptionFieldController,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText:
            "Este es un teléfono insignia. Con este dispositivo, Samsung presenta su nueva Serie F.",
        labelText: "Descripción",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (_) {
        if (desciptionFieldController.text.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: null,
    );
  }

  Widget buildSellerField() {
    return TextFormField(
      controller: sellerFieldController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "Masdamas",
        labelText: "Vendedor",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (_) {
        if (sellerFieldController.text.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildOriginalPriceField() {
    return TextFormField(
      controller: originalPriceFieldController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "5.999",
        labelText: "Precio Original (en Pesos)",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (_) {
        if (originalPriceFieldController.text.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget buildDiscountPriceField() {
    return TextFormField(
      controller: discountPriceFieldController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "2.499",
        labelText: "Precio Descuento (en Pesos)",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (_) {
        if (discountPriceFieldController.text.isEmpty) {
          return FIELD_REQUIRED_MSG;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Future<void> saveProductButtonCallback(BuildContext context) async {
    if (validateBasicDetailsForm() == false) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Erros en el formulario de detalles básicos"),
        ),
      );
      return;
    }
    if (validateDescribeProductForm() == false) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Errores en el formulario de descripción del producto"),
        ),
      );
      return;
    }
    final productDetails = Provider.of<ProductDetails>(context, listen: false);
    if (productDetails.selectedImages.length < 1) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Cargue al menos una imagen del producto"),
        ),
      );
      return;
    }
    if (productDetails.productType == null) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Seleccione el tipo de producto"),
        ),
      );
      return;
    }
    if (productDetails.searchTags.length < 3) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Agregue al menos 3 etiquetas"),
        ),
      );
      return;
    }
    String productId;
    String snackbarMessage;
    try {
      product.productType = productDetails.productType;
      product.searchTags = productDetails.searchTags;
      final productUploadFuture = newProduct
          ? ProductDatabaseHelper().addUsersProduct(product)
          : ProductDatabaseHelper().updateUsersProduct(product);
      productUploadFuture.then((value) {
        productId = value;
      });
      await showDialog(
        context: context,
        builder: (context) {
          return FutureProgressDialog(
            productUploadFuture,
            message:
                Text(newProduct ? "Subiendo producto" : "Actualización de producto"),
          );
        },
      );
      if (productId != null) {
        snackbarMessage = "La información del producto se actualizó correctamente";
      } else {
        throw "No se pudo actualizar la información del producto debido a un problema desconocido";
      }
    } on FirebaseException catch (e) {
      Logger().w("Firebase Exception: $e");
      snackbarMessage = "Something went wrong";
    } catch (e) {
      Logger().w("Unknown Exception: $e");
      snackbarMessage = e.toString();
    } finally {
      Logger().i(snackbarMessage);
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(snackbarMessage),
        ),
      );
    }
    if (productId == null) return;
    bool allImagesUploaded = false;
    try {
      allImagesUploaded = await uploadProductImages(productId);
      if (allImagesUploaded == true) {
        snackbarMessage = "Todas las imágenes subidas con éxito";
      } else {
        throw "Algunas imágenes no se pudieron cargar. Vuelve a intentarlo.";
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
    List<String> downloadUrls = productDetails.selectedImages
        .map((e) => e.imgType == ImageType.network ? e.path : null)
        .toList();
    bool productFinalizeUpdate = false;
    try {
      final updateProductFuture =
          ProductDatabaseHelper().updateProductsImages(productId, downloadUrls);
      productFinalizeUpdate = await showDialog(
        context: context,
        builder: (context) {
          return FutureProgressDialog(
            updateProductFuture,
            message: Text("Cargando Producto"),
          );
        },
      );
      if (productFinalizeUpdate == true) {
        snackbarMessage = "Producto cargado correctamente";
      } else {
        throw "No se pudo cargar el producto correctamente. Vuelva a intentarlo.";
      }
    } on FirebaseException catch (e) {
      Logger().w("Firebase Exception: $e");
      snackbarMessage = "Something went wrong";
    } catch (e) {
      Logger().w("Unknown Exception: $e");
      snackbarMessage = e.toString();
    } finally {
      Logger().i(snackbarMessage);
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(snackbarMessage),
        ),
      );
    }
    Navigator.pop(context);
  }

  Future<bool> uploadProductImages(String productId) async {
    bool allImagesUpdated = true;
    final productDetails = Provider.of<ProductDetails>(context, listen: false);
    for (int i = 0; i < productDetails.selectedImages.length; i++) {
      if (productDetails.selectedImages[i].imgType == ImageType.local) {
        print("Se está subiendo la imagen: " + productDetails.selectedImages[i].path);
        String downloadUrl;
        try {
          final imgUploadFuture = FirestoreFilesAccess().uploadFileToPath(
              File(productDetails.selectedImages[i].path),
              ProductDatabaseHelper().getPathForProductImage(productId, i));
          downloadUrl = await showDialog(
            context: context,
            builder: (context) {
              return FutureProgressDialog(
                imgUploadFuture,
                message: Text(
                    "Cargando imágenes ${i + 1}/${productDetails.selectedImages.length}"),
              );
            },
          );
        } on FirebaseException catch (e) {
          Logger().w("Firebase Exception: $e");
        } catch (e) {
          Logger().w("Firebase Exception: $e");
        } finally {
          if (downloadUrl != null) {
            productDetails.selectedImages[i] =
                CustomImage(imgType: ImageType.network, path: downloadUrl);
          } else {
            allImagesUpdated = false;
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content:
                    Text("No se pudo cargar la imagen. ${i + 1} debido a algún problema"),
              ),
            );
          }
        }
      }
    }
    return allImagesUpdated;
  }

  Future<void> addImageButtonCallback({int index}) async {
    final productDetails = Provider.of<ProductDetails>(context, listen: false);
    if (index == null && productDetails.selectedImages.length >= 3) {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Se pueden cargar un máximo de 3 imágenes")));
      return;
    }
    String path;
    String snackbarMessage;
    try {
      path = await choseImageFromLocalFiles(context);
      if (path == null) {
        throw LocalImagePickingUnknownReasonFailureException();
      }
    } on LocalFileHandlingException catch (e) {
      Logger().i("Excepción de manejo de archivos locales: $e");
      snackbarMessage = e.toString();
    } catch (e) {
      Logger().i("Excepción desconocida: $e");
      snackbarMessage = e.toString();
    } finally {
      if (snackbarMessage != null) {
        Logger().i(snackbarMessage);
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(snackbarMessage),
          ),
        );
      }
    }
    if (path == null) {
      return;
    }
    if (index == null) {
      productDetails.addNewSelectedImage(
          CustomImage(imgType: ImageType.local, path: path));
    } else {
      productDetails.setSelectedImageAtIndex(
          CustomImage(imgType: ImageType.local, path: path), index);
    }
  }
}
