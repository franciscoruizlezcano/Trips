import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardImage extends StatelessWidget {
  String _pathImage;
  double _height;
  double _width;
  AlignmentGeometry _alignment;
  Widget _child;
  EdgeInsetsGeometry _margin;

  CardImage({String pathImage, double height, double width, AlignmentGeometry alignment, Widget child, EdgeInsetsGeometry margin}) {
    this._pathImage = pathImage;
    this._height = height;
    this._width = width;
    this._alignment = alignment;
    this._child = child;
    this._margin = margin;
  }

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: this._height,
      width: this._width,
      margin: this._margin,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(this._pathImage)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0)
            )
          ]),
    );

    List<Widget> children = new List<Widget>();
    children.add(card);

    if(this._child != null){
      children.add(this._child);
    }

    return Stack(
      alignment: this._alignment,
      children: children,
    );
  }
}
