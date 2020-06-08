import 'package:flutter/material.dart';

class ButtonCircular extends StatelessWidget {
  String _title;
  EdgeInsetsGeometry _margin;

  ButtonCircular({String title, EdgeInsetsGeometry margin}) {
    this._title = title;
    this._margin = margin;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Naving"))
        );
      },
      child: Container(
        margin: this._margin,
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
              this._title, 
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
