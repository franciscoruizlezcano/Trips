import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> signIn() async{
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    AuthResult authResult = await _auth.signInWithCredential(GoogleAuthProvider.getCredential(idToken: gSA.idToken, accessToken: gSA.accessToken));

    return authResult.user;
  }
  
  void signOut() async{
    await _auth.signOut().then((value) => print("Log out session"));
    await _googleSignIn.signOut().then((value) =>  print("Log out Google"));
  }

}