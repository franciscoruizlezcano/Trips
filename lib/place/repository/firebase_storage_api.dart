import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageAPI{

  // ignore: non_constant_identifier_names
  final String USERS = "users";

  // ignore: non_constant_identifier_names
  final String PLACES = "places";

  StorageReference _storageReference = FirebaseStorage.instance.ref();

  //Instance with Firebase API
  final Firestore _db = Firestore.instance;


  Future<StorageUploadTask> uploadFile(String path, File image) async {
    return _storageReference.child(path).putFile(image);
  }
}