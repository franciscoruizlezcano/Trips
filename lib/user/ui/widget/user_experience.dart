import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserExperience extends StatelessWidget {

  String fullname;
  int experience;
  String pathImage;

  UserExperience({this.fullname, this.experience, this.pathImage});

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
          image: AssetImage(this.pathImage),
        ),
      ),
    );

    final details = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.fullname,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
          Text(
            "Experience: ${this.experience} years",
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