import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/user/bloc/user_bloc.dart';
import 'package:trips/user/model/user.dart';

class UserInfo extends StatelessWidget {
  UserBloc _userBloc;

  @override
  Widget build(BuildContext context) {
    this._userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: this._userBloc.authStatus,
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
            widget = this._showProfileData(snapshot);
            break;
          case ConnectionState.done:
            widget = this._showProfileData(snapshot);
            break;
        }
        return widget;
      }
    );
  }

  Widget _showProfileData(AsyncSnapshot snapshot){
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
      print(user.uid);
      widget = this._getUserInfoWidget(user);
    }
    return widget;
  }

  Widget _getUserInfoWidget(User user){
    final name_email = Column(
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
            photo,
            Expanded(child: name_email),
          ]),
        ]
    );
  }
}
