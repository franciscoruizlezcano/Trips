import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {

  double width;
  double height;
  BorderRadiusGeometry borderRadius;
  bool circle = false;

  GradientBack({Key key, @required this.width, @required this.height, @required this.borderRadius, @required this.circle});


  @override
  Widget build(BuildContext context) {
    Widget child;

    if(this.circle){
      child = this._getCircle();
    }

    return Container(
      height: this.height,
      width: this.width,
      decoration: BoxDecoration(
        borderRadius: this.borderRadius,
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
      child: child,
    );
  }

  Widget _getCircle(){
    return FittedBox(
      fit: BoxFit.none,
      alignment: Alignment(-2.5, -0.8),
      child: Container(
        width: this.height,
        height: this.height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.05),
          borderRadius: BorderRadius.circular(this.height / 2),
        ),
      ),
    );
  }
}