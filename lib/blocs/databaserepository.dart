import 'dart:io';


import 'package:firebase_storage/firebase_storage.dart';
import 'package:masdamas/blocs/database.dart';
import 'package:masdamas/blocs/firebaseauthapi.dart';
import 'package:masdamas/locator.dart';
import 'package:masdamas/models/user.dart';




class CloudFirestoreRepository {

  final _cloudFirestoreAPI =Database();
  

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserDate(user);

  FirebaseStorage _storage =
  FirebaseStorage.instanceFor(bucket:"gs://masdamas-49803.appspot.com");
  Firebaseapi _authRepo = locator.get<Firebaseapi>();

  Future<String> uploadFile(File file) async {
    User user = await _authRepo.getUser();
    var userId = user.uid;

    var storageRef = _storage.ref().child("user/profile/$userId");
    var uploadTask = storageRef.putFile(file);
    var imageurl =await(await uploadTask).ref.getDownloadURL();
    String downloadUrl = imageurl.toString();
    return downloadUrl;
  }

  Future<String> getUserProfileImage(String uid) async {
    return await _storage.ref().child("user/profile/$uid").getDownloadURL();
  }

}