import 'package:flutter/material.dart';
import 'package:trips/place/ui/widget/description_place.dart';
import 'package:trips/widget/card_image.dart';
import 'package:trips/widget/card_image_list.dart';
import 'package:trips/widget/floating_action_button.dart';
import 'package:trips/widget/gradient_back.dart';
import 'package:trips/widget/header_appbar.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {

  String _title = "Welcome";
  String _description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut sollicitudin risus. Sed pellentesque dui eu metus semper scelerisque. Aliquam nec lectus lectus. Morbi cursus suscipit posuere. Etiam at est a sapien feugiat ultrices quis at lectus. Mauris rhoncus, enim ut dapibus tincidunt, dolor neque posuere ipsum, ac sagittis libero metus at lacus. Etiam velit nibh, sodales eget tristique vehicula, lacinia in augue. Donec pellentesque hendrerit nibh et fermentum.";

  @override
  Widget build(BuildContext context) {

    List<CardImage> cardImageList = new List<CardImage>();

    for (var i = 0; i < 3; i++) {
      cardImageList.add(
        CardImage(
          height: 200.0,
          width: 300.0,
          pathImage: "assets/images/wallpaper_$i.jpeg",
          margin: EdgeInsets.only(left: 10.0, right: 10.0),
          alignment: Alignment.bottomRight,
          child: FloatingActionButtonGreen(
            icon: Icon(Icons.favorite_border),
            onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(content: Text("Naving"))),
          ),
        )
      );
    }

    final Widget cardImageListWidget = CardImageList(
      scrollDirection: Axis.horizontal,
      children: cardImageList,
      height: 200.0,
    );

    final Widget headerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderAppbar(title: this._title, back: false, margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 20.0)),
        cardImageListWidget
      ],
    );

    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            DescriptionPlace(
              stars: 5,
              description: this._description,
              title: "Bahamas",
            )
          ],
        ),
        GradientBack(
            width: MediaQuery.of(context).size.width,
            height: 250,
            circle: false
        ),
        headerWidget

      ],
    );
  }
}
