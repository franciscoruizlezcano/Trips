import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trips/user/ui/widget/user_info.dart';

import 'buttons_bar.dart';

class HeaderProfile extends StatelessWidget {
  String _title;

  HeaderProfile({String title}) {
    this._title = title;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 20.0, left: 20.0),
            child: Text(
              this._title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            alignment: Alignment.bottomLeft
          ),
          UserInfo(),
          ButtonsBar(),
        ],
      ),
    );
  }
}

