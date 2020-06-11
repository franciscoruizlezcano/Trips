import 'package:flutter/material.dart';
import 'package:trips/user/ui/widget/header_profile.dart';
import 'package:trips/user/ui/widget/user_info.dart';
import 'package:trips/user/ui/widget/buttons_bar.dart';
import 'package:trips/widget/gradient_back.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        GradientBack(height: 300.0, width: MediaQuery.of(context).size.width,circle: true,),
        ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          children: [
            HeaderProfile(title: "Profile",)
          ],
        )
      ],
    );
  }
}
