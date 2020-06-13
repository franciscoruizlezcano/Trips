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
    this.id,
    @required this.name,
    @required this.description,
    this.urlImage,
    this.likes,
    this.creatorUser,
  });
}