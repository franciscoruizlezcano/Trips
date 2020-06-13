import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonSubmit extends StatelessWidget {
  String title;
  EdgeInsetsGeometry margin;
  VoidCallback onPressed;

  ButtonSubmit({@required this.title, @required this.onPressed, this.margin});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Container(
          margin: this.margin,
          height: 50.0,
          width: 180.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Color(0xFF4268D3),
          ),
          child:Center(
            child: Text(
                this.title,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                )
            ),
          )
      ),

    );
  }
}
