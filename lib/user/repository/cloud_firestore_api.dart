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
    FirebaseUser user = await auth.currentUser();

    ref.add({
      "id": place.id,
      "name": place.name,
      "description": place.description,
      "location": place.location,
      "urlImage": place.urlImage,
      "likes": place.likes,
      "creatorUser": _db.document("$USERS/${user.uid}"), //type data: reference
    }).then((DocumentReference dr) async{
      DocumentSnapshot snapshot = await dr.get();
      DocumentReference refUser = _db.collection(USERS).document(user.uid);
      refUser.updateData({
        'places' : FieldValue.arrayUnion([_db.document("$PLACES/${snapshot.documentID}")])
      });
    });

  }

  List<Place> find(List<DocumentSnapshot> documentSnapshotList){
    List<Place> response = new List<Place>();

    documentSnapshotList.forEach((element) {
      Place place = new Place();

      //Set data
      place.id = element.data['id'];
      place.name = element.data['name'];
      place.description = element.data['description'];
      place.urlImage = element.data['urlImage'];
      place.likes = element.data['likes'];
      place.location = element.data['location'];


      response.add(place);
    });

    return response;
  }
}