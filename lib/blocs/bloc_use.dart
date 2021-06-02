import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:masdamas/blocs/databaserepository.dart';
import 'package:masdamas/blocs/firebaseauthapi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:masdamas/models/user.dart' as Model ;
import 'auth.dart';



class UserBloc implements Bloc {

Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
Stream<User> get authStatus => streamFirebase;
final _firebaseauthapi = Firebaseapi();
final _auth = Auth();

signOut(){
_firebaseauthapi.signOut();
}

final _cloudFirestoreRepository = CloudFirestoreRepository();
void updateUserData(Model.User user) async => _cloudFirestoreRepository.updateUserDataFirestore(user);

Future<UserCredential>loging(){

  return _auth.logingoogle();
}

 @override
 dispose() async {

  }

}
 