import 'package:flutter/material.dart';
import 'package:trips/place/model/place.dart';
import 'package:trips/widget/floating_action_button.dart';

class ProfilePlace extends StatelessWidget {

  Place _place;


  ProfilePlace({Place place}){
    this._place = place;
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
            this._place.name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
          Text(
            this._place.description,
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