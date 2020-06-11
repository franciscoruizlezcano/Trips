import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trips/user/model/user.dart';

class CloudFirestoreAPI{

  final String USERS = "users";
  final String PLACE = "places";

  //Instance with Firebase API
  final Firestore _db = Firestore.instance;

  void updateUserData(User user) async{
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoUrl': user.photoUrl,
      'places': user.places,
      'favoritePlaces': user.favoritePlaces,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }
}