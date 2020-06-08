import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {

  String _title;
  double _height;
  BorderRadiusGeometry _borderRadius;

  GradientBack({String title, double height, BorderRadiusGeometry borderRadius}){
    this._title = title;
    this._height = height;
    this._borderRadius = borderRadius;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this._height,
      decoration: BoxDecoration(
        borderRadius: this._borderRadius,
        gradient: LinearGradient(
          colors: [
            Color(0xFF4268D3),
            Color(0xFF584CD1),
          ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp
        ),
      ),
      child: Text(
        this._title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold
        ),
      ),
      alignment: Alignment(-0.9, -0.6),
    );
  }
}