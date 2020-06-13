import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/place/model/place.dart';
import 'package:trips/place/repository/firebase_storage_repository.dart';
import 'package:trips/user/repository/cloud_firestore_repository.dart';

class PlaceBloc implements Bloc {

  CloudFirestoreRepository _cloudFirestoreRepository;
  FirebaseStorageRepository _firebaseStorageRepository;

  Future<void> updateData(Place place) => _cloudFirestoreRepository.updatePlaceDataFirestore(place);

  Future<StorageUploadTask> uploadFile(String path, File file) => _firebaseStorageRepository.uploadFileFirestorage(path, file);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}