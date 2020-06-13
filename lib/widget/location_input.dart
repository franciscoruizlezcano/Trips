import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LocationInput extends StatelessWidget{

  String hintText;
  TextEditingController controller;
  // ignore: non_constant_identifier_names
  final int _MAXLINES = 1;
  EdgeInsetsGeometry margin;
  EdgeInsetsGeometry padding;

  LocationInput({@required this.hintText, @required this.controller, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: this.margin,
      padding: this.padding,
      child: TextField(
        controller: this.controller,
        keyboardType: TextInputType.text,
        maxLines: this._MAXLINES,
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.location_on),
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            hintText: this.hintText,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                borderRadius: BorderRadius.all(Radius.circular(9.0))
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                borderRadius: BorderRadius.all(Radius.circular(9.0))
            )
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15.0,
          )
        ]
      ),
    );
  }
}