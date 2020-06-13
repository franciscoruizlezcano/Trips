import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/place/model/place.dart';
import 'package:trips/user/repository/cloud_firestore_api.dart';

class PlaceBloc implements Bloc {

  final CloudFirestoreAPI _cloudFirestoreAPI = new CloudFirestoreAPI();

  Future<void> updateData(Place place) => _cloudFirestoreAPI.updatePlaceData(place);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}