import 'package:flutter/material.dart';
import 'package:masdamas/sizec.dart';

const kPrimaryColor = Color(0xFFCC0202);
const kShopColor = Color(0xFFFF710F);
const kPrimaryLightColor = Color(0xFFFFc873a);
const kSecondaryColor = Color(0xFF0f2e4e);
const kTextColor = Color(0xFF0f2e4e);

const kDefaultPadding = 20.0;

const kAnimationDuration = Duration(milliseconds: 200);

final kDefaultShadow = BoxShadow(
  offset: Offset(5, 5),
  blurRadius: 10,
  color: Color(0xFF343434).withOpacity(0.56),
);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Por favor introduzca su correo electrónico";
const String kInvalidEmailError = "introduzca un correo electrónico válido";
const String kPassNullError = "Por favor, introduzca su contraseña";
const String kShortPassError = "La contraseña es demasiado corta";
const String kMatchPassError = "Las contraseñas no coinciden";
const String kNamelNullError = "Por favor, escriba su nombre";
const String kPhoneNumberNullError =
    "Por favor, introduzca su número de teléfono";
const String kAddressNullError = "Ingrese su dirección";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
