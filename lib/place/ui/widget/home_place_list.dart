import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/place/bloc/place_bloc.dart';
import 'package:trips/place/model/place.dart';
import 'package:trips/widget/card_image.dart';
import 'package:trips/widget/card_image_list.dart';
import 'package:trips/widget/floating_action_button.dart';


class HomePlaceList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    PlaceBloc placeBloc = BlocProvider.of<PlaceBloc>(context);

    // TODO: implement build
    return StreamBuilder(
      stream: placeBloc.placesStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        Widget widget;
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
            widget = Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.none:
            widget = Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
            widget = this._getCardImageList(context, snapshot);
            break;
          case ConnectionState.done:
            widget = this._getCardImageList(context, snapshot);
            break;
        }
        return widget;
      },
    );
  }

  Widget _getCardImageList(BuildContext context, AsyncSnapshot snapshot) {
    return CardImageList(
      scrollDirection: Axis.horizontal,
      children: this._getPlaceList(context, snapshot.data.documents),
      height: 200.0,
    );
  }

  List<CardImage> _getPlaceList(BuildContext context, List<DocumentSnapshot> documentSnapshotList){

    PlaceBloc placeBloc = BlocProvider.of<PlaceBloc>(context);

    List<CardImage> cardImageList = new List<CardImage>();

    List<Place> placeList = placeBloc.find(documentSnapshotList);

    for(var i = 0; i < placeList.length; i++){

      CardImage cardImage = CardImage(
        height: 200.0,
        width: 300.0,
        image: NetworkImage(placeList[i].urlImage),
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        alignment: Alignment.bottomRight,
        child: FloatingActionButtonGreen(
          icon: Icon(Icons.favorite_border),
          onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(content: Text("Naving"))),
        ),
      );

      cardImageList.add(cardImage);
    }

    return cardImageList;
  }

}