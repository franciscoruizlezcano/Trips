import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonCircle extends StatefulWidget{

  VoidCallback onTap;
  double height;
  double width;
  EdgeInsetsGeometry margin;
  Icon icon;
  Color color;

  ButtonCircle({this.onTap, this.height, this.width, this.margin, this.icon, this.color});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonCircleState();
  }

}


class _ButtonCircleState extends State<ButtonCircle>{

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        margin: widget.margin,
        child: widget.icon,
        decoration:
        BoxDecoration(shape: BoxShape.circle, color: widget.color),
      ),
    );
  }
}