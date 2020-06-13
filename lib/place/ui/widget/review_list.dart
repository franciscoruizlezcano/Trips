import 'package:flutter/material.dart';
import 'package:trips/place/ui/widget/review.dart';

class ReviewList extends StatefulWidget {
  @override
  _ReviewListState createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review(
          fullname: "John Doe",
          comment: "Excellent service",
          pathImage: "assets/images/people.jpg",
          photos: 5,
          reviews: 10,
        ),
        Review(
          fullname: "Emma Watson",
          comment: "Very good",
          pathImage: "assets/images/girl.jpg",
          photos: 5,
          reviews: 10,
        ),
        Review(
          fullname: "Chris O'Donnell",
          comment: "Perfect",
          pathImage: "assets/images/people.jpg",
          photos: 5,
          reviews: 2,
        ),
      ],
    );
  }
}
