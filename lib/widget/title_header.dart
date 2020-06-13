import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleHeader extends StatelessWidget{

  String title;

  TitleHeader({@required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      this.title,
      style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold
      ),
    );
  }

}