import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  String _fullname;
  String _email;
  String _pathImage;

  UserInfo({String fullname, String email, String pathImage}) {
    this._fullname = fullname;
    this._email = email;
    this._pathImage = pathImage;
  }

  @override
  Widget build(BuildContext context) {
    final fullname = Container(
      child: Text(
        this._fullname,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 26.0, color: Colors.white),
      ),
    );

    final email = Text(
      this._email,
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.white, fontSize: 16.0),
    );

    final fullname_email = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[fullname, email],
      ),
    );

    final photo = Container(
      height: 80.0,
      width: 80.0,
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2.0),
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage(this._pathImage)),
      ),
    );

    final options = Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 30.0,
            width: 30.0,
            margin: EdgeInsets.all(15.0),
            child: Icon(
              Icons.note,
              color: Colors.blue,
              size: 15.0,
            ),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color.fromRGBO(255, 255, 255, 0.7)),
          ),
          Container(
            height: 45.0,
            width: 45.0,
            margin: EdgeInsets.all(15.0),
            child: Icon(
              Icons.add,
              color: Colors.blue,
            ),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          ),
          Container(
            height: 30.0,
            width: 30.0,
            margin: EdgeInsets.all(15.0),
            child: Icon(
              Icons.exit_to_app,
              color: Colors.blue,
              size: 15.0,
            ),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color.fromRGBO(255, 255, 255, 0.7)),
          ),
        ],
      ),
    );

    return Container(
      margin: EdgeInsets.only(top: 100.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                photo, 
                Expanded(child: fullname_email),
              ]
            ),
            options
          ]),
    );
  }
}
