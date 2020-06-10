import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/user/bloc/user_bloc.dart';
import 'package:trips/user/ui/widget/user_info.dart';
import 'package:trips/widget/gradient_back.dart';

class HeaderAppbar extends StatelessWidget {
  String _title;
  UserBloc _userBloc;

  HeaderAppbar({String title}) {
    this._title = title;
  }

  @override
  Widget build(BuildContext context) {
    this._userBloc = BlocProvider.of(context);

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
