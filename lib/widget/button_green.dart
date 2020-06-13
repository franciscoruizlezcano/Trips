import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonGreen extends StatefulWidget {
  String title;
  EdgeInsetsGeometry margin;
  double width;
  double height;
  void Function() onTap;

  ButtonGreen({@required this.title, this.margin, this.width, this.height, @required this.onTap});

  @override
  State createState() {
    return _ButtonGreenState();
  }
}

class _ButtonGreenState extends State<ButtonGreen> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: Container(
        margin: widget.margin,
        height: widget.height,
        width: widget.width,
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
              widget.title,
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