import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/place/model/place.dart';
import 'package:trips/place/repository/firebase_storage_repository.dart';
import 'package:trips/user/repository/cloud_firestore_api.dart';
import 'package:trips/user/repository/cloud_firestore_repository.dart';

class PlaceBloc implements Bloc {

  final CloudFirestoreRepository _cloudFirestoreRepository = new CloudFirestoreRepository();
  final FirebaseStorageRepository _firebaseStorageRepository = new FirebaseStorageRepository();

  Future<void> updateData(Place place) => _cloudFirestoreRepository.updatePlaceDataFirestore(place);

  Future<StorageUploadTask> uploadFile(String path, File file) => _firebaseStorageRepository.uploadFileFirestorage(path, file);

  //List places
  Stream<QuerySnapshot> _placesListStream = Firestore.instance.collection(CloudFirestoreAPI().PLACES).snapshots();
  Stream<QuerySnapshot> get placesStream => this._placesListStream;
  
  // List places of user
  Stream<QuerySnapshot> placesListByUserStream(String uid) => Firestore.instance.collection(CloudFirestoreAPI().PLACES)
      .where("creatorUser", isEqualTo: Firestore.instance.document("${CloudFirestoreAPI().USERS}/${uid}"))
      .snapshots();

  List<Place> find(List<DocumentSnapshot> documentSnapshotList){
      return _cloudFirestoreRepository.find(documentSnapshotList);
  }

    @override
    void dispose() {
      // TODO: implement dispose
    }
  }
