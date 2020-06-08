import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  @override
  _FloatingActionButtonGreenState createState() => _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {

  void _onPressed(BuildContext context){
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text("On press"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min, //Se adapta al tamaño del contenido
            children: <Widget>[
              Text("You pressed the button")
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Text("Ok")
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      mini: true,
      tooltip: "Fav",
      child: Icon(Icons.favorite_border),
      onPressed: () => this._onPressed(context),
    );
  }
}