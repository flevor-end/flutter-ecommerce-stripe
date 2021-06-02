import 'package:flutter/material.dart';

import 'components/body.dart';

class MacroScreen extends StatelessWidget {
  static String routeName = 'personal';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
