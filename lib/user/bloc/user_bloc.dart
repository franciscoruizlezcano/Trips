import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/user/model/user.dart';
import 'package:trips/user/repository/auth_repository.dart';
import 'package:trips/user/repository/cloud_firestore_api.dart';

class UserBloc implements Bloc {

  final AuthRepository _authRepository = new AuthRepository();

  final CloudFirestoreAPI _cloudFirestoreAPI = new CloudFirestoreAPI();

  //Stream --> Firebase
  Stream<FirebaseUser> _streamFirebase = FirebaseAuth.instance.onAuthStateChanged;

  Stream<FirebaseUser> get authStatus{
    return this._streamFirebase;
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