import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Alert extends StatelessWidget{

  String title;
  String description;

  Alert({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Text(this.title),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(this.description),
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: ()=>Navigator.of(context).pop(),
            child: Text('Cancel')
        ),
        FlatButton(
            onPressed: (){},
            child: Text('Ok')
        ),

      ],
    );
  }

}