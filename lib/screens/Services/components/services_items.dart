import 'package:flutter/material.dart';
import 'package:masdamas/screens/Services/components/services_card.dart';

class ServiceItems extends StatelessWidget {
  const ServiceItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        spacing: 5,
        runSpacing: 10,
        children: <Widget>[
          ServicesCard(
            shoppingCardNum: 'Logistica',
            isDone: true,
            press: () {},
          ),
          ServicesCard(
            shoppingCardNum: 'Limpieza \nGeneral Salud',
            isDone: true,
            press: () {},
          ),
          ServicesCard(
            shoppingCardNum: 'Cursos \nvirtuales',
            isDone: true,
            press: () {},
          ),
          ServicesCard(
            shoppingCardNum: 'Reparaciones \nHogar/Oficina',
            isDone: true,
            press: () {},
          ),
          ServicesCard(
            shoppingCardNum: 'Reparacion\nElectrodomésticos',
            isDone: true,
            press: () {},
          ),
          ServicesCard(
            shoppingCardNum: 'Transporte \nPúblico',
            isDone: true,
            press: () {},
          ),
          ServicesCard(
            shoppingCardNum: 'Transporte \nPrivado',
            isDone: true,
            press: () {},
          ),
          ServicesCard(
            shoppingCardNum: 'Servicios \nPublicos',
            isDone: true,
            press: () {},
          ),
          ServicesCard(
            shoppingCardNum: 'Instalaciones \nEn Casa/Oficina',
            isDone: true,
            press: () {},
          ),
          ServicesCard(
            shoppingCardNum: 'Ofertas\nLaborales',
            isDone: true,
            press: () {},
          ),
          ServicesCard(
            shoppingCardNum: 'Tratamientos\nCorporales',
            isDone: true,
            press: () {},
          ),
          ServicesCard(
            shoppingCardNum: 'Capacitacion\nProfesional',
            isDone: true,
            press: () {},
          ),
        ],
      ),
    );
  }
}
