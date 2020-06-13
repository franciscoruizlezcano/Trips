import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/place/model/place.dart';
import 'package:trips/user/model/user.dart';
import 'package:trips/user/repository/auth_repository.dart';
import 'package:trips/user/repository/cloud_firestore_api.dart';
import 'package:trips/user/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {

  AuthRepository _authRepository = new AuthRepository();

  CloudFirestoreAPI _cloudFirestoreAPI = new CloudFirestoreAPI();

  CloudFirestoreRepository _cloudFirestoreRepository = new CloudFirestoreRepository();

  //Stream --> Firebase
  Stream<FirebaseUser> _streamFirebase = FirebaseAuth.instance.onAuthStateChanged;

  Stream<FirebaseUser> get authStatus{
    return this._streamFirebase;
  }

  Future<FirebaseUser> get currentUser{
    return FirebaseAuth.instance.currentUser();
  }

  Future<FirebaseUser> signIn(){
    return _authRepository.signInFirebase();
  }

  void signOut() => _authRepository.signOutFirebase();

  void updateData(User user) => _cloudFirestoreAPI.updateUserData(user);

  @override
  void dispose() {
    // TODO: implement dispose
  }
  
}