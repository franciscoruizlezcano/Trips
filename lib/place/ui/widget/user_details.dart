import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  String _fullname;
  int _reviews;
  int _photos;
  String _comment;

  UserDetails({String fullname, String comment, int reviews, int photos}) {
    this._fullname = fullname;
    this._reviews = reviews;
    this._photos = photos;
    this._comment = comment;
  }

  @override
  Widget build(BuildContext context) {
    final fullname = Text(
      this._fullname,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 23.0,
      ),
    );

    final details = Container(
      child: Row(
        children: <Widget>[
          Text(
            "${this._reviews} reviews · ${this._photos} photos",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
        ],
      ),
    );

    final comment = Container(
        margin: EdgeInsets.only(top: 5.0, right: 30.0),
        child: Text(
          this._comment,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w900),
        ));

    return Container(
      margin: EdgeInsets.only(top:20.0, left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[fullname, details, comment],
      ),
    );
  }
}
