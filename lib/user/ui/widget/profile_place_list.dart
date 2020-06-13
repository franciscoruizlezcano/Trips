import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/place/bloc/place_bloc.dart';
import 'package:trips/place/model/place.dart';
import 'package:trips/user/bloc/user_bloc.dart';
import 'package:trips/user/model/user.dart';
import 'package:trips/user/ui/widget/profile_place.dart';

// ignore: must_be_immutable
class ProfilePlaceList extends StatelessWidget{
  User user;
  PlaceBloc placeBloc;

  ProfilePlaceList({this.user});

  @override
  Widget build(BuildContext context) {
    placeBloc = BlocProvider.of<PlaceBloc>(context);

    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
        left: 20.0,
        right: 20.0,
        bottom: 10.0
      ),
      child: StreamBuilder(
        stream: placeBloc.placesListByUserStream(this.user.uid),
        builder:  (BuildContext context, AsyncSnapshot snapshot){
          Widget widget;
          switch(snapshot.connectionState){
            case ConnectionState.waiting:
              widget = Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 4),
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.none:
              widget = Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 4),
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
              widget = this._getPlacesData(context, snapshot);
              break;
            case ConnectionState.done:
              widget = this._getPlacesData(context, snapshot);
              break;
          }
          return widget;
        },
      ),
    );
  }

  Widget _getPlacesData(BuildContext context, AsyncSnapshot snapshot){
    UserBloc useBloc = BlocProvider.of<UserBloc>(context);
    Widget widget;

    if(!snapshot.hasData || snapshot.hasError){
      widget = Container(
        child: Column(
          children: [
            CircularProgressIndicator(),
            Text(
              "Error in the load user places",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
              ),
            )
          ],
        ),
      );
    }else{
      widget = Container(
        child: Column(
          children: this._getProfilePlaceList(context, snapshot.data.documents),
        ),
      );
    }
    return widget;
  }

  List<ProfilePlace> _getProfilePlaceList(BuildContext context, List<DocumentSnapshot> documentSnapshotList){
    List<ProfilePlace> profilePlaceList = new List<ProfilePlace>();

    placeBloc = BlocProvider.of<PlaceBloc>(context);

    List<Place> placeList = placeBloc.find(documentSnapshotList);

    for(var i = 0; i < placeList.length; i++){
      profilePlaceList.add(ProfilePlace(place: placeList[i]));
    }
    return profilePlaceList;
  }

}