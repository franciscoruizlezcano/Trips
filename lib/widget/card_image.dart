import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardImage extends StatelessWidget {
  ImageProvider<dynamic> image;
  double height;
  double width;
  AlignmentGeometry alignment;
  Widget child;
  EdgeInsetsGeometry margin;

  CardImage({ this.image, this.height, this.width, this.alignment, this.child, this.margin});

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: this.height,
      width: this.width,
      margin: this.margin,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: this.image),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0)
            )
          ]),
    );

    List<Widget> children = new List<Widget>();
    children.add(card);

    if(this.child != null){
      children.add(this.child);
    }

    return Stack(
      alignment: this.alignment,
      children: children,
    );
  }
}
