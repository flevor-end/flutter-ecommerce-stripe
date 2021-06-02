
import 'package:get_it/get_it.dart';
import 'package:masdamas/blocs/databaserepository.dart';
import 'package:masdamas/blocs/firebaseauthapi.dart';
import 'package:masdamas/blocs/user_controller.dart';


final locator = GetIt.instance;

void setupServices() {
  locator.registerSingleton<Firebaseapi>(Firebaseapi());
  locator.registerSingleton<CloudFirestoreRepository>(CloudFirestoreRepository());
  locator.registerSingleton<UserController>(UserController());
}