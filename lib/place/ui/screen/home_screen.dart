import 'package:flutter/material.dart';
import 'package:trips/place/ui/widget/description_place.dart';
import 'package:trips/place/ui/widget/home_place_list.dart';
import 'package:trips/widget/gradient_back.dart';
import 'package:trips/widget/header_appbar.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {

  String _title = "Welcome";
  String _description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut sollicitudin risus. Sed pellentesque dui eu metus semper scelerisque. Aliquam nec lectus lectus. Morbi cursus suscipit posuere. Etiam at est a sapien feugiat ultrices quis at lectus. Mauris rhoncus, enim ut dapibus tincidunt, dolor neque posuere ipsum, ac sagittis libero metus at lacus. Etiam velit nibh, sodales eget tristique vehicula, lacinia in augue. Donec pellentesque hendrerit nibh et fermentum.";

  @override
  Widget build(BuildContext context) {


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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderAppbar(title: this._title, back: false, margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 20.0)),
            HomePlaceList()
          ],
        )
      ],
    );

  }
}
