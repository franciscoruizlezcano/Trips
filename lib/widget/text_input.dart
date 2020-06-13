import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextInput extends StatelessWidget{

  String hintText;
  TextInputType textInputType;
  TextEditingController controller;
  int maxLines = 1;
  EdgeInsetsGeometry margin;
  EdgeInsetsGeometry padding;

  TextInput({@required this.hintText, @required this.textInputType, @required this.controller, this.maxLines, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: this.margin,
      padding: this.padding,
      child: TextFormField(
        controller: this.controller,
        keyboardType: this.textInputType,
        maxLines: this.maxLines,
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFe5e5e5),
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
        validator: (value) {
          String response;
          if(value.isEmpty){
            response = "Please complete this input";
          }
          return response;
        },
      ),
    );
  }

}