import 'package:flutter/material.dart';

import 'components/body.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: Body(),
    );
    ;
  }
}
