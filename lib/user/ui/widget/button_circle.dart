import 'package:flutter/material.dart';

class ButtonCircle extends StatefulWidget{

  VoidCallback _onTap;
  double _height;
  double _width;
  EdgeInsetsGeometry _margin;
  Icon _icon;
  Color _color;

  ButtonCircle({VoidCallback onTap, double height, double width, EdgeInsetsGeometry margin, Icon icon, Color color}){
    this._onTap = onTap;
    this._height = height;
    this._width = width;
    this._margin = margin;
    this._icon = icon;
    this._color = color;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonCircleState();
  }

}


class _ButtonCircleState extends State<ButtonCircle>{

  _ButtonCircleState(){

  }

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: widget._onTap,
      child: Container(
        height: widget._height,
        width: widget._width,
        margin: widget._margin,
        child: widget._icon,
        decoration:
        BoxDecoration(shape: BoxShape.circle, color: widget._color),
      ),
    );
  }
}