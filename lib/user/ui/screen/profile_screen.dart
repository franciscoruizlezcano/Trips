import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/user/bloc/user_bloc.dart';
import 'package:trips/user/model/user.dart';
import 'package:trips/user/ui/widget/header_profile.dart';
import 'package:trips/user/ui/widget/profile_place_list.dart';
import 'package:trips/widget/gradient_back.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          Widget widget;
          switch(snapshot.connectionState){
            case ConnectionState.waiting:
              widget = CircularProgressIndicator();
              break;
            case ConnectionState.none:
              widget = CircularProgressIndicator();
              break;
            case ConnectionState.active:
              widget = this._showProfile(context, snapshot);
              break;
            case ConnectionState.done:
              widget = this._showProfile(context, snapshot);
              break;
          }
          return widget;
        }
    );
  }

  Widget _showProfile(BuildContext context, AsyncSnapshot snapshot) {

    Widget widget;
    if(!snapshot.hasData || snapshot.hasError){
      widget = Container(
        child: Column(
          children: [
            CircularProgressIndicator(),
            Text(
              "Error in the load user",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
              ),
            )
          ],
        ),
      );
    }else{
      User user = new User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoUrl: snapshot.data.photoUrl
      );
      widget = this._getHeaderWidget(context, user);
    }
    return widget;
  }

  Widget _getHeaderWidget(BuildContext context, User user) {
    return Stack(
      children: <Widget>[
        GradientBack(height: 300.0, width: MediaQuery.of(context).size.width,circle: true),
        ListView(
          scrollDirection: Axis.vertical,
          children: [
            HeaderProfile(title: "Profile", user: user),
            ProfilePlaceList(user: user)
          ],
        )
      ],
    );
  }
}
