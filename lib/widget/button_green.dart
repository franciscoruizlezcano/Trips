import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  String _title;
  EdgeInsetsGeometry _margin;
  double _width;
  double _height;
  void Function() _onTap;

  ButtonGreen({@required String title, EdgeInsetsGeometry margin, double width, double height, @required void Function() onTap}) {
    this._title = title;
    this._margin = margin;
    this._width = width;
    this._height = height;
    this._onTap = onTap;
  }

  @override
  State createState() {
    return _ButtonGreenState();
  }
}

class _ButtonGreenState extends State<ButtonGreen> {
  String _title;
  EdgeInsetsGeometry _margin;
  double _width;
  double _height;
  void Function() _onTap;

  _ButtonGreenState({String title, EdgeInsetsGeometry margin, double width, double height, void Function() onTap}) {
    this._title = title;
    this._margin = margin;
    this._width = width;
    this._height = height;
    this._onTap = onTap;
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget._onTap,
        child: Container(
        margin: widget._margin,
        height: widget._height,
        width: widget._width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
                colors: [
                  Color(0xFFA7FF84),
                  Color(0xFF1CBB78),
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp
            )
        ),
        child: Center(
          child: Text(
              widget._title,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              )
          ),
        )

    ),);
  }
}