import 'package:flutter/material.dart';
import 'package:trips/place/model/place.dart';

class User {
  String uid;
  String name;
  String email;
  String photoUrl;

  List<Place> places;
  List<Place> favoritePlaces;

  User({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoUrl,
    this.places,
    this.favoritePlaces
  });

}