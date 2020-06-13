import 'package:flutter/material.dart';
import 'package:trips/place/ui/widget/review_list.dart';
import 'package:trips/place/ui/widget/star.dart';
import 'package:trips/widget/button_purple.dart';

// ignore: must_be_immutable
class DescriptionPlace extends StatelessWidget {
  String _title;
  String _description;
  int _stars;

  DescriptionPlace({String title, String description, int stars}) {
    this._title = title;
    this._description = description;
    this._stars = stars;
  }

  @override
  Widget build(BuildContext context) {
    final title = Container(
        margin: EdgeInsets.only(top: 300.0, left: 20.0, right: 20.0),
        child: Text(
          this._title,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.left,
        ));

    final stars = Row(
      children: Star().getStarList(this._stars, EdgeInsets.only(top: 303.0, right: 3.0)),
    );

    final titleStars = Row(
      children: <Widget>[title, stars],
    );

    final description = Container(
      margin: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
      child: Text(
        this._description,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );

    final allReviews = Container(
      margin: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
      child: Text(
        "All reviews",
        textAlign: TextAlign.left,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        titleStars,
        description,
        allReviews,
        ButtonPurple(
          title: "Navigate",
          margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 200.0, bottom: 20.0),
          onTap: () => Scaffold.of(context).showSnackBar(SnackBar(content: Text("Naving"))),
        ),
        ReviewList()
      ],
    );
  }
}
