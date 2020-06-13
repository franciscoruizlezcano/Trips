import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonPurple extends StatelessWidget {
  String title;
  EdgeInsetsGeometry margin;
  VoidCallback onTap;

  ButtonPurple({@required this.title, @required this.onTap,this.margin});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        margin: this.margin,
        height: 50.0,
        width: 180.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
              colors: [
                Color(0xFF4268D3),
                Color(0xFF584CD1),
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp
            )
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
