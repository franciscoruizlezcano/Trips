import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:trips/place/repository/firebase_storage_api.dart';

class FirebaseStorageRepository{

  FirebaseStorageAPI _firebaseStorageAPI;

  Future<StorageUploadTask> uploadFileFirestorage(String path, File image) async{
    return _firebaseStorageAPI.uploadFile(path, image);
  }
}