import 'package:flutter/material.dart';

class Place {

  String id;
  String name;
  String description;
  String urlImage;
  String location;
  int likes;

  Place({Key key, this.id, this.name, this.description, this.location, this.urlImage, this.likes});
}