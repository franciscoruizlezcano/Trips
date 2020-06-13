import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserDetails extends StatelessWidget {
  String fullname;
  int reviews;
  int photos;
  String comment;

  UserDetails({Key key, @required this.fullname, @required this.comment, @required this.reviews, @required this.photos});

  @override
  Widget build(BuildContext context) {
    final fullname = Text(
      this.fullname,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 23.0,
      ),
    );

    final details = Container(
      child: Row(
        children: <Widget>[
          Text(
            "${this.reviews} reviews · ${this.photos} photos",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
        ],
      ),
    );

    final comment = Container(
        margin: EdgeInsets.only(top: 5.0, right: 30.0),
        child: Text(
          this.comment,
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
