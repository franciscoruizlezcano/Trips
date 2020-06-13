import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/user/bloc/user_bloc.dart';
import 'package:trips/user/model/user.dart';

// ignore: must_be_immutable
class UserInfo extends StatelessWidget {
  User user;

  UserInfo({this.user});

  @override
  Widget build(BuildContext context) {
    final nameEmail = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          user.name,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 23.0, color: Colors.white),
        ),
        Text(
          user.email,
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        )
      ],
    );

    final photo = Container(
      height: 80.0,
      width: 80.0,
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2.0),
        shape: BoxShape.circle,
        image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(user.photoUrl)),
      ),
    );

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(children: <Widget>[
            photo, Expanded(child: nameEmail),
          ]),
        ]
    );
  }
}
