import 'package:flutter/material.dart';
import 'package:trips/place/ui/widget/user_details.dart';

class Review extends StatelessWidget {
  String _fullname;
  int _reviews;
  int _photos;
  int _stars;
  String _comment;
  String _pathImage;

  Review({String fullname, String comment, String pathImage, int reviews, int photos, int stars}) {
    this._fullname = fullname;
    this._comment = comment;
    this._pathImage = pathImage;
    this._reviews = reviews;
    this._photos = photos;
    this._stars = stars;
  }

  @override
  Widget build(BuildContext context) {

    final photo = Container(
      width: 80.0,
      height: 80.0,
      margin: EdgeInsets.only(left: 20.0, top: 20.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(this._pathImage)
        ),
      ),
    );

    return Row(
      children: <Widget>[
        photo, 
        Expanded(
          child:UserDetails(
            fullname: this._fullname, 
            comment: this._comment, 
            reviews: this._reviews, 
            photos: this._photos
          )
        )
      ],
    );
  }
}
