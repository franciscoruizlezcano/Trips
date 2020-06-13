import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trips/user/model/user.dart';
import 'package:trips/place/model/place.dart';

class CloudFirestoreAPI{

  // ignore: non_constant_identifier_names
  final String USERS = "users";

  // ignore: non_constant_identifier_names
  final String PLACES = "places";

  //Instance with Firebase API
  final Firestore _db = Firestore.instance;

  void updateUserData(User user) async{
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return await ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoUrl': user.photoUrl,
      'places': user.places,
      'favoritePlaces': user.favoritePlaces,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }

  Future<void> updatePlaceData(Place place) async{
    CollectionReference ref = _db.collection(PLACES);

    final FirebaseAuth auth = FirebaseAuth.instance;

    await auth.currentUser().then((FirebaseUser user){
      ref.add({
      "id": place.id,
      "name": place.name,
      "description": place.description,
      "urlImage": place.urlImage,
      "likes": place.likes,
      "creatorUser": "$USERS/${user.uid}", //type data: reference
      });
    });


  }
}