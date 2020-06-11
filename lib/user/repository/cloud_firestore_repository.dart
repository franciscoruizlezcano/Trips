import 'package:trips/user/model/user.dart';
import 'package:trips/user/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository{

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

}