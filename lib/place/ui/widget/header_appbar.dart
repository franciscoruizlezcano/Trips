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
        GradientBack(height: 250.0, width: MediaQuery.of(context).size.width,circle: true),
        Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 30.0, bottom: 30.0, left: 20.0),
              child: Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            CardImageList(
              scrollDirection: Axis.horizontal,
              children: this._cardImageList,
              height: 200.0,
            )
          ],
        )
      ],
    );
  }
}