import 'dart:async';
import 'package:flutter/material.dart';
import 'package:masdamas/locator.dart';
import 'package:masdamas/routes.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:masdamas/blocs/bloc_use.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:masdamas/theme.dart';
import 'screens/splashscreen.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServices();
  runApp(
   Phoenix(
      child: App(),
    )
  );
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        return MyApp();
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MASDAMAS',
          theme: theme(),
          initialRoute: SplashScreen.routeName,
          routes: routes,
        ),
        bloc: UserBloc());
  }
}
