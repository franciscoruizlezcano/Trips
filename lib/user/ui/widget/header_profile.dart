import 'package:flutter/material.dart';
import 'package:trips/user/model/user.dart';
import 'package:trips/user/ui/widget/user_info.dart';
import 'package:trips/widget/header_appbar.dart';
import 'package:trips/user/ui/widget/buttons_bar.dart';

// ignore: must_be_immutable
class HeaderProfile extends StatelessWidget {
  String title;
  User user;

  HeaderProfile({this.title, this.user});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          HeaderAppbar(title: this.title, back: false, margin: EdgeInsets.only(top: 10.0, bottom: 20.0, left: 10.0), alignment: Alignment.bottomLeft),
          UserInfo(user: this.user),
          ButtonsBar(),
        ],
      ),
    );
  }
}

