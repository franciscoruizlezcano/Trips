import 'package:flutter/material.dart';
import 'package:trips/widget/card_image.dart';
import 'package:trips/widget/card_image_list.dart';
import 'package:trips/widget/gradient_back.dart';

class HeaderAppbar extends StatelessWidget {

  String _title;
  List<CardImage> _cardImageList;

  HeaderAppbar({String title, List<CardImage> cardImageList}){
    this._title = title;
    this._cardImageList = cardImageList;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack(
          title: this._title,
          height: 250.0,
        ),
        CardImageList(
          scrollDirection: Axis.horizontal,
          children: this._cardImageList,
          height: 320.0,
        )
      ],
    );
  }
}