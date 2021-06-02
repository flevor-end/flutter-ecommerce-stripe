// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:masdamas/components/default_button.dart';
// import 'package:masdamas/models/Address.dart';
// import 'package:masdamas/services/database/user_database_helper.dart';
// import 'package:masdamas/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';
// import 'package:string_validator/string_validator.dart';

// class AddressDetailsForm extends StatefulWidget {
//   final Address addressToEdit;
//   AddressDetailsForm({
//     Key key,
//     this.addressToEdit,
//   }) : super(key: key);

//   @override
//   _AddressDetailsFormState createState() => _AddressDetailsFormState();
// }

// class _AddressDetailsFormState extends State<AddressDetailsForm> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController titleFieldController = TextEditingController();

//   final TextEditingController receiverFieldController = TextEditingController();

//   final TextEditingController addressLine1FieldController =
//       TextEditingController();

//   final TextEditingController addressLine2FieldController =
//       TextEditingController();

//   final TextEditingController cityFieldController = TextEditingController();

//   final TextEditingController districtFieldController = TextEditingController();

//   final TextEditingController stateFieldController = TextEditingController();

//   final TextEditingController landmarkFieldController = TextEditingController();

//   final TextEditingController pincodeFieldController = TextEditingController();

//   final TextEditingController phoneFieldController = TextEditingController();

//   @override
//   void dispose() {
//     titleFieldController.dispose();
//     receiverFieldController.dispose();
//     addressLine1FieldController.dispose();
//     addressLine2FieldController.dispose();
//     cityFieldController.dispose();
//     stateFieldController.dispose();
//     districtFieldController.dispose();
//     landmarkFieldController.dispose();
//     pincodeFieldController.dispose();
//     phoneFieldController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final form = Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           SizedBox(height: getProportionateScreenHeight(20)),
//           buildTitleField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildReceiverField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildAddressLine1Field(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildAddressLine2Field(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildCityField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildDistrictField(),
//           //SizedBox(height: getProportionateScreenHeight(30)),
//           //buildStateField(),
//           //SizedBox(height: getProportionateScreenHeight(30)),
//           //buildLandmarkField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildPincodeField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildPhoneField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           DefaultButton(
//             text: "Guardar Dirección",
//             press: widget.addressToEdit == null
//                 ? saveNewAddressButtonCallback
//                 : saveEditedAddressButtonCallback,
//           ),
//         ],
//       ),
//     );
//     if (widget.addressToEdit != null) {
//       titleFieldController.text = widget.addressToEdit.title;
//       receiverFieldController.text = widget.addressToEdit.receiver;
//       addressLine1FieldController.text = widget.addressToEdit.addresLine1;
//       addressLine2FieldController.text = widget.addressToEdit.addressLine2;
//       cityFieldController.text = widget.addressToEdit.city;
//       districtFieldController.text = widget.addressToEdit.district;
//       stateFieldController.text = widget.addressToEdit.state;
//       landmarkFieldController.text = widget.addressToEdit.landmark;
//       pincodeFieldController.text = widget.addressToEdit.pincode;
//       phoneFieldController.text = widget.addressToEdit.phone;
//     }
//     return form;
//   }

//   Widget buildTitleField() {
//     return TextFormField(
//       controller: titleFieldController,
//       keyboardType: TextInputType.name,
//       maxLength: 8,
//       decoration: InputDecoration(
//         hintText: "Título para la dirección",
//         labelText: "Título",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//       validator: (value) {
//         if (titleFieldController.text.isEmpty) {
//           return FIELD_REQUIRED_MSG;
//         }
//         return null;
//       },
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//     );
//   }

//   Widget buildReceiverField() {
//     return TextFormField(
//       controller: receiverFieldController,
//       keyboardType: TextInputType.name,
//       decoration: InputDecoration(
//         hintText: "Nombre completo de quien recibe",
//         labelText: "Nombre del destinatario",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//       validator: (value) {
//         if (receiverFieldController.text.isEmpty) {
//           return FIELD_REQUIRED_MSG;
//         }
//         return null;
//       },
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//     );
//   }

//   Widget buildAddressLine1Field() {
//     return TextFormField(
//       controller: addressLine1FieldController,
//       keyboardType: TextInputType.streetAddress,
//       decoration: InputDecoration(
//         hintText: "Dirección Línea No. 1",
//         labelText: "Dirección Línea No. 1",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//       validator: (value) {
//         if (addressLine1FieldController.text.isEmpty) {
//           return FIELD_REQUIRED_MSG;
//         }
//         return null;
//       },
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//     );
//   }

//   Widget buildAddressLine2Field() {
//     return TextFormField(
//       controller: addressLine2FieldController,
//       keyboardType: TextInputType.streetAddress,
//       decoration: InputDecoration(
//         hintText: "Dirección Línea No. 2",
//         labelText: "Dirección Línea No. 2",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//       validator: (value) {
//         if (addressLine2FieldController.text.isEmpty) {
//           return FIELD_REQUIRED_MSG;
//         }
//         return null;
//       },
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//     );
//   }

//   Widget buildCityField() {
//     return TextFormField(
//       controller: cityFieldController,
//       keyboardType: TextInputType.name,
//       decoration: InputDecoration(
//         hintText: "Ingrese Ciudad",
//         labelText: "Ciudad",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//       validator: (value) {
//         if (cityFieldController.text.isEmpty) {
//           return FIELD_REQUIRED_MSG;
//         }
//         return null;
//       },
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//     );
//   }

//   Widget buildDistrictField() {
//     return TextFormField(
//       controller: districtFieldController,
//       keyboardType: TextInputType.name,
//       decoration: InputDecoration(
//         hintText: "Ingrese Barrio",
//         labelText: "Barrio",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//       validator: (value) {
//         if (districtFieldController.text.isEmpty) {
//           return FIELD_REQUIRED_MSG;
//         }
//         return null;
//       },
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//     );
//   }

//   Widget buildStateField() {
//     return TextFormField(
//       controller: stateFieldController,
//       keyboardType: TextInputType.name,
//       decoration: InputDecoration(
//         hintText: "Enter State",
//         labelText: "State",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//       validator: (value) {
//         if (stateFieldController.text.isEmpty) {
//           return FIELD_REQUIRED_MSG;
//         }
//         return null;
//       },
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//     );
//   }

//   Widget buildPincodeField() {
//     return TextFormField(
//       controller: pincodeFieldController,
//       keyboardType: TextInputType.number,
//       decoration: InputDecoration(
//         hintText: "Codigo Postal",
//         labelText: "Codigo Postal",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//       validator: (value) {
//         if (pincodeFieldController.text.isEmpty) {
//           return FIELD_REQUIRED_MSG;
//         } else if (!isNumeric(pincodeFieldController.text)) {
//           return "Campo de solo dígitos";
//         } else if (pincodeFieldController.text.length != 6) {
//           return "El código debe tener solo 6 dígitos";
//         }
//         return null;
//       },
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//     );
//   }

//   // Widget buildLandmarkField() {
//   //   return TextFormField(
//   //     controller: landmarkFieldController,
//   //     keyboardType: TextInputType.name,
//   //     decoration: InputDecoration(
//   //       hintText: "Enter Landmark",
//   //       labelText: "Landmark",
//   //       floatingLabelBehavior: FloatingLabelBehavior.always,
//   //     ),
//   //     validator: (value) {
//   //       if (landmarkFieldController.text.isEmpty) {
//   //         return FIELD_REQUIRED_MSG;
//   //       }
//   //       return null;
//   //     },
//   //     autovalidateMode: AutovalidateMode.onUserInteraction,
//   //   );
//   // }

//   Widget buildPhoneField() {
//     return TextFormField(
//       controller: phoneFieldController,
//       keyboardType: TextInputType.phone,
//       decoration: InputDecoration(
//         hintText: "Número de Teléfono",
//         labelText: "Número de Teléfono",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//       validator: (value) {
//         if (phoneFieldController.text.isEmpty) {
//           return FIELD_REQUIRED_MSG;
//         } else if (phoneFieldController.text.length != 10) {
//           return "Solo 10 dígitos";
//         }
//         return null;
//       },
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//     );
//   }

//   Future<void> saveNewAddressButtonCallback() async {
//     if (_formKey.currentState.validate()) {
//       _formKey.currentState.save();
//       final Address newAddress = generateAddressObject();
//       bool status = false;
//       String snackbarMessage;
//       try {
//         status =
//             await UserDatabaseHelper().addAddressForCurrentUser(newAddress);
//         if (status == true) {
//           snackbarMessage = "Dirección guardada con éxito";
//         } else {
//           throw "No se pudo guardar la dirección debido a una razón desconocida";
//         }
//       } on FirebaseException catch (e) {
//         Logger().w("Firebase Exception: $e");
//         snackbarMessage = "Something went wrong";
//       } catch (e) {
//         Logger().w("Unknown Exception: $e");
//         snackbarMessage = "Something went wrong";
//       } finally {
//         Logger().i(snackbarMessage);
//         Scaffold.of(context).showSnackBar(
//           SnackBar(
//             content: Text(snackbarMessage),
//           ),
//         );
//       }
//     }
//   }

//   Future<void> saveEditedAddressButtonCallback() async {
//     if (_formKey.currentState.validate()) {
//       _formKey.currentState.save();
//       final Address newAddress =
//           generateAddressObject(id: widget.addressToEdit.id);

//       bool status = false;
//       String snackbarMessage;
//       try {
//         status =
//             await UserDatabaseHelper().updateAddressForCurrentUser(newAddress);
//         if (status == true) {
//           snackbarMessage = "Dirección actualizada correctamente";
//         } else {
//           throw "No se pudo actualizar la dirección debido a un motivo desconocido";
//         }
//       } on FirebaseException catch (e) {
//         Logger().w("Firebase Exception: $e");
//         snackbarMessage = "Something went wrong";
//       } catch (e) {
//         Logger().w("Unknown Exception: $e");
//         snackbarMessage = "Something went wrong";
//       } finally {
//         Logger().i(snackbarMessage);
//         Scaffold.of(context).showSnackBar(
//           SnackBar(
//             content: Text(snackbarMessage),
//           ),
//         );
//       }
//     }
//   }

//   Address generateAddressObject({String id}) {
//     return Address(
//       id: id,
//       title: titleFieldController.text,
//       receiver: receiverFieldController.text,
//       addresLine1: addressLine1FieldController.text,
//       addressLine2: addressLine2FieldController.text,
//       city: cityFieldController.text,
//       district: districtFieldController.text,
//       state: stateFieldController.text,
//       landmark: landmarkFieldController.text,
//       pincode: pincodeFieldController.text,
//       phone: phoneFieldController.text,
//     );
//   }
// }