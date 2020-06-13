import 'package:flutter/material.dart';
import 'package:trips/widget/card_image.dart';

// ignore: must_be_immutable
class CardImageList extends StatelessWidget {

  Axis _scrollDirection;
  List<CardImage> _children;
  double _height;
  double _width;
  EdgeInsetsGeometry _margin;
  EdgeInsetsGeometry _padding;

  CardImageList({double height, double width, EdgeInsetsGeometry margin, EdgeInsetsGeometry padding,Axis scrollDirection,List<CardImage> children}){
    this._height = height;
    this._width = width;
    this._margin = margin;
    this._children = children;
    this._scrollDirection = scrollDirection;
    this._padding = padding;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this._height,
      width: this._width,
      margin: this._margin,
      child: ListView(
        scrollDirection: this._scrollDirection,
        padding: this._padding,
        children: this._children,
      ),
    );
  }
}
