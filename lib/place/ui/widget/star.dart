import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Star extends StatelessWidget {
  bool _boder;
  EdgeInsetsGeometry _margin;

  final int _cantStars = 5;

  Star({bool border, EdgeInsetsGeometry margin}) {
    this._boder = border;
    this._margin = margin;
  }

  List<Widget> getStarList(int stars, EdgeInsetsGeometry margin) {
    List<Widget> starList = new List<Widget>();

    if (stars <= 5 && stars > 0) {
      int starsFalse = this._cantStars - stars;

      for (var i = 0; i < stars; i++) {
        starList.add(new Star(border: false, margin: margin));
      }
      for (var i = 0; i < starsFalse; i++) {
        starList.add(new Star(border: true, margin: margin));
      }
    }

    return starList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this._margin,
      child: Icon((this._boder) ? Icons.star_border : Icons.star,
          color: Colors.yellow[800]),
    );
  }
}
