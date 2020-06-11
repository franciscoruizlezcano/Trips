import 'package:firebase_auth/firebase_auth.dart';
import 'package:trips/user/repository/firebase_auth_api.dart';

class AuthRepository{

  final _firebaseAuthAPI = new FirebaseAuthAPI();

  Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signIn();

  void signOutFirebase() => _firebaseAuthAPI.signOut();
}