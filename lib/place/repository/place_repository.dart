import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trips/place/model/place.dart';
import 'package:trips/user/repository/cloud_firestore_api.dart';

class PlaceRepository{
  final _cloudFirestoreAPI = new CloudFirestoreAPI();

  List<Place> findByUser(List<DocumentSnapshot> documentSnapshotList){
    return _cloudFirestoreAPI.find(documentSnapshotList);
  }
}