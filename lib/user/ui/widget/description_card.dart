import 'package:flutter/material.dart';
import 'package:trips/widget/floating_action_button.dart';

class DescriptionCard extends StatelessWidget {

  String _title;
  String _description;


  DescriptionCard({String title, String description}){
    this._title = title;
    this._description = description;
  }

  @override
  Widget build(BuildContext context) {

    final card =  Container(
      height: 100,
      width: 250,
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Colors.white,
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0)
            ),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this._title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
          Text(
            this._description,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0
            ),
          )
        ],
      ),
    );

    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        card,
        FloatingActionButtonGreen()
      ],
    );
  }
}