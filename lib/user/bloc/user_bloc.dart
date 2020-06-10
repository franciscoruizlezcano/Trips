import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/user/repository/auth_repository.dart';

class UserBloc implements Bloc {

  final AuthRepository _authRepository = new AuthRepository();

  //Stream --> Firebase
  Stream<FirebaseUser> _streamFirebase = FirebaseAuth.instance.onAuthStateChanged;

  Stream<FirebaseUser> get authStatus{
    return this._streamFirebase;
  }

  Future<FirebaseUser> signIn(){
    return _authRepository.signInFirebase();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
  
}