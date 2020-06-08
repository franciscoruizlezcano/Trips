import 'package:flutter/material.dart';
import 'package:trips/user/ui/widget/user_info.dart';
import 'package:trips/widget/gradient_back.dart';

class HeaderAppbar extends StatelessWidget {
  String _title;

  HeaderAppbar({String title}) {
    this._title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack(
          title: this._title,
          height: 300.0,
        ),
        UserInfo(
          fullname: "John Doe",
          email: "johndoe@email.com",
          pathImage: "assets/images/people.jpg",
        )
      ],
    );
  }
}
