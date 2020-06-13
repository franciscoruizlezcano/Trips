import 'package:trips/place/model/place.dart';
import 'package:trips/user/model/user.dart';
import 'package:trips/user/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository{

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceDataFirestore(Place place) => _cloudFirestoreAPI.updatePlaceData(place);
  
}