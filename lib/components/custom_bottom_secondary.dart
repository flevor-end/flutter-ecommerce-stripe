import 'package:flutter/material.dart';
import 'package:masdamas/screens/home/components/screen_args.dart';
import 'package:masdamas/screens/home/components/seccion_ins.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomSecondary extends StatelessWidget {
  const CustomBottomSecondary({
    Key key,
    @required this.selectedMenu,
    @required this.inActiveIconColor,
  }) : super(key: key);

  final MenuState selectedMenu;
  final Color inActiveIconColor;

  @override
  Widget build(BuildContext context) {
    return  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
        
            GestureDetector(
              onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            SeccionIns.routeName, (Route<dynamic> route) => false,
                            arguments: ScreenArguments(0));
                      },
              child: Text(
                'Nosotros',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: kPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
              GestureDetector(
                    onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            SeccionIns.routeName, (Route<dynamic> route) => false,
                            arguments: ScreenArguments(1));
                      },
              child: Text(
                'Soporte',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: kPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
              GestureDetector(
                 onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            SeccionIns.routeName, (Route<dynamic> route) => false,
                            arguments: ScreenArguments(2));
                      },
              child: Text(
                'Unidos',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: kPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
                onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            SeccionIns.routeName, (Route<dynamic> route) => false,
                            arguments: ScreenArguments(3));
                      },
              child: Text(
                'Oportunidades',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: kPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
        
          ],
        
    
    );
  }
}
