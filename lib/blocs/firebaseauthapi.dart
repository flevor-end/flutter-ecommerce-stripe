import 'package:firebase_auth/firebase_auth.dart' ;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masdamas/models/user.dart' as Model;

class Firebaseapi {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();


 Firebaseapi();

void signOut() async{

await _auth.signOut();
googleSignIn.signOut();

}


  Future<Model.User> getUser() async {
    User useru = FirebaseAuth.instance.currentUser;
    return Model.User(useru?.uid,
    name: useru?.displayName,
    image: useru?.photoURL );
  }

  
  Future<Model.User> signInWithEmailAndPassword(
  {String email, String password}) async {
  var authResult = await _auth.signInWithEmailAndPassword(
  email: email, password: password);
  return Model.User(authResult.user.uid,name: authResult.user.displayName);
    
  }

  Future<void> updateDisplayName(String displayName) async {
  User useru = FirebaseAuth.instance.currentUser;
    useru.updateProfile(
    displayName:displayName
    );
  }
    
  Future<void> updatePhotoUrl(String imageUrl) async {
    
    User useru = FirebaseAuth.instance.currentUser;
    useru.updateProfile(
    photoURL:imageUrl,
    );
  }



 Future <UserCredential> signIn() async {
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
     accessToken: googleAuth.accessToken,
     idToken: googleAuth.idToken,
   
   
  );


  // Once signed in, return the UserCredential
 return await FirebaseAuth.instance.signInWithCredential(credential);

 
}



}
 
  

  
