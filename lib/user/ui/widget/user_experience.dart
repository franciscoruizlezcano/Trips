import 'package:flutter/material.dart';

class UserExperience extends StatelessWidget {

  String _fullname;
  int _experience;
  String _pathImage;

  UserExperience({String fullname, int experience, String pathImage}){
    this._fullname = fullname;
    this._experience = experience;
    this._pathImage = pathImage;
  }

  @override
  Widget build(BuildContext context) {

    final photo = Container(
      width: 60.0,
      height: 60.0,
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(this._pathImage),
        ),
      ),
    );

    final details = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this._fullname,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
          Text(
            "Experience: ${this._experience} years",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 10.0
            ),
          )
        ],
      ),
    );

    final icon = Container(
      width: 40.0,
      height: 40.0,
      margin: EdgeInsets.only(left: 120.0, right:10.0, top: 5.0, bottom: 5.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.redAccent[100]
      ),
      child: Icon(
        Icons.email,
        color: Colors.white,
      ),
    );

    return 
    Container(
      margin: EdgeInsets.only(top:10.0 ,bottom: 10.0),
      child: Row(
      children: <Widget>[
        photo,
        details,
        icon
      ],
    ));
  }
}