import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FloatingActionButtonGreen extends StatelessWidget {

  Icon icon;
  VoidCallback onPressed;

  FloatingActionButtonGreen({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Colors.green,
      mini: true,
      child: this.icon,
      onPressed: this.onPressed,
    );
  }

}