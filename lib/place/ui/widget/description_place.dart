import 'package:flutter/material.dart';
import 'package:trips/place/ui/widget/review_list.dart';
import 'package:trips/place/ui/widget/star.dart';
import 'package:trips/widget/button_circular.dart';

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
        margin: EdgeInsets.only(top: 350.0, left: 20.0, right: 20.0),
        child: Text(
          this._title,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.left,
        ));

    final stars = Row(
      children: Star().getStarList(this._stars, EdgeInsets.only(top: 353.0, right: 3.0)),
    );

    final title_stars = Row(
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

    final all_reviews = Container(
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
        title_stars,
        description,
        all_reviews,
        ButtonCircular(
          title: "Navigate",
          margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 200.0, bottom: 20.0),
        ),
        ReviewList()
      ],
    );
  }
}
