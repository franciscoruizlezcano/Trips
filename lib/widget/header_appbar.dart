import 'package:flutter/material.dart';
import 'package:trips/widget/title_header.dart';

// ignore: must_be_immutable
class HeaderAppbar extends StatelessWidget{
  
  String title;
  bool back;
  EdgeInsetsGeometry margin;
  EdgeInsetsGeometry padding;
  AlignmentGeometry alignment;

  HeaderAppbar({@required this.title, @required this.back, this.margin, this.padding, this.alignment});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: this.alignment,
      margin: this.margin,
      padding: this.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this._getHeader(context),
      ),
    );
  }
  
  List<Widget> _getHeader(BuildContext context){
    List<Widget> response = new List<Widget>();
    
    if(this.back){
      response.add(
          SizedBox(
            height: 45.0,
            width: 45.0,
            child: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white,), onPressed: () => Navigator.of(context).pop()),
          )
      );
    }

    response.add(
        Flexible(
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: TitleHeader(title: this.title)
          ),
        )
    );
    
    return response;
  }
  
  
}