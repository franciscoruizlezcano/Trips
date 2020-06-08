import 'package:flutter/material.dart';
import 'package:trips/user/ui/widget/description_card.dart';
import 'package:trips/user/ui/widget/header_appbar.dart';
import 'package:trips/widget/card_image.dart';
import 'package:trips/widget/card_image_list.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CardImage> cardImageList = new List<CardImage>();

    for (var i = 0; i < 3; i++) {
      cardImageList.add(
        CardImage(
          pathImage: "assets/images/wallpaper_${i}.jpeg",
          alignment: Alignment(0.1, 1.5),
          height: 200.0,
          margin: EdgeInsets.only(top: 100.0, left: 10.0, right: 10.0),
          child: DescriptionCard(
            title: "Test",
            description: "Lorem ipsum ",
          ),
          width: MediaQuery.of(context).size.width,
        )
      );
    }

    return Container(
      child: Stack(
        children: <Widget>[
          HeaderAppbar(
            title: "Profile",
          ),
          CardImageList(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 150.0, bottom: 150.0),
            height: 4000,
            children: cardImageList,
          )
        ],
      ),
    );
  }
}
