import 'dart:io';

import 'package:masdamas/blocs/databaserepository.dart';
import 'package:masdamas/blocs/firebaseauthapi.dart';
import 'package:masdamas/locator.dart';
import 'package:masdamas/models/user.dart' as model;



class UserController {
  model.User _currentUser;
  Firebaseapi _authRepo = locator.get<Firebaseapi>();
  CloudFirestoreRepository _storageRepo = locator.get<CloudFirestoreRepository>();
  Future init;
  bool color;

  UserController() {
    init = initUser();
  }

  Future<model.User> initUser() async {
    _currentUser = await _authRepo.getUser();
    return _currentUser;
  }

  model.User get currentUser => _currentUser;

  Future<void> uploadProfilePicture(File image) async {
    return await _storageRepo.uploadFile(image);
  }

  Future<String> getDownloadUrl() async {
    return await _storageRepo.getUserProfileImage(currentUser.uid);
  }

  Future<void> signI() async {
     _currentUser = await _authRepo.getUser();
    return _currentUser;
    
  }

  void updateDisplayName(String displayName) {
    _currentUser.name = displayName;
    _authRepo.updateDisplayName(displayName);
  } 
  
    void updatePhotoUrl(String imageUrl) {
    _currentUser.image= imageUrl;
    _authRepo.updatePhotoUrl(imageUrl);
  }
bool get changeColor => false;

}