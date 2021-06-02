import 'package:firebase_auth/firebase_auth.dart';
import 'firebaseauthapi.dart';

class Auth {

final _firebaseapi = Firebaseapi();

Future<UserCredential>logingoogle()=> _firebaseapi.signIn();

singOut() => _firebaseapi.signOut();

}
