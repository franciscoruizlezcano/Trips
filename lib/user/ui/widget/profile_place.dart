import 'package:flutter/material.dart';
import 'package:trips/place/model/place.dart';
import 'package:trips/widget/card_image.dart';
import 'package:trips/widget/floating_action_button.dart';

// ignore: must_be_immutable
class ProfilePlace extends StatelessWidget {

  Place place;

  ProfilePlace({@required this.place});

  @override
  Widget build(BuildContext context) {

    final card =  Container(
      height: 100,
      width: 250,
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Colors.white,
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0)
            ),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            this.place.name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.0
            ),
          ),
          Text(
            this.place.description,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0
            ),
          ),
          Text(
            "Likes: " + this.place.likes.toString(),
            style: TextStyle(
              color: Colors.amber,
              fontSize: 12.0
            ),
          ),
        ],
      ),
    );

    return Container(
      margin: EdgeInsets.only(bottom: 40),
      padding: EdgeInsets.only(bottom: 40),
      child: CardImage(
        height: 200.0,
        width: MediaQuery.of(context).size.width,
        image: NetworkImage(this.place.urlImage),
        alignment: Alignment(0, 2),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            card,
            FloatingActionButtonGreen(icon: Icon(Icons.favorite), onPressed: null,)
          ],
        ),
      ),
    );
  }
}