import 'package:flutter/material.dart';
import 'package:trips/user/model/user.dart';

class Place {

  String id;
  String name;
  String description;
  String urlImage;
  int likes;
  User creatorUser;

  Place({
    Key key,
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.urlImage,
    this.likes,
    @required this.creatorUser,
  });
}