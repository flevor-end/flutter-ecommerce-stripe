import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:masdamas/models/user.dart';

class Database {
  // ignore: non_constant_identifier_names
  final String USERS = 'users';

  /// The main Firestore user collection
   
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  
  void updateUserDate(User user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    return ref.set({
    'uid': user.uid,
    'name': user.name,
    'photoUrl': user.image,
    'document':user.document ,
    'documenttype':user.documenttype ,
    }, SetOptions(merge: true));
  }
  
}
