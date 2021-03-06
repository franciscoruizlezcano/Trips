import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trips/place/ui/screen/add_place_screen.dart';
import 'package:trips/user/bloc/user_bloc.dart';

import 'button_circle.dart';

// ignore: must_be_immutable
class ButtonsBar extends StatelessWidget{
  UserBloc _userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    this._userBloc = BlocProvider.of(context);

    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonCircle(
            onTap: () => print("paso"),
            height: 40.0,
            width: 40.0,
            color: Color.fromRGBO(255, 255, 255, 0.7),
            icon: Icon(
              Icons.note,
              color: Colors.blue,
              size: 20.0,
            ),
          ),
          ButtonCircle(
            onTap: () async{
              
              File image;
              ImagePicker picker = new ImagePicker();

              picker.getImage(source: ImageSource.camera).then((PickedFile pickedFile){
                image = File(pickedFile.path);

                Navigator.push(context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new AddPlaceScreen(image: image)
                    )
                );
              });
            },
            height: 60.0,
            width: 60.0,
            color: Colors.white,
            icon: Icon(
              Icons.add,
              color: Colors.blue,
              size: 30.0,
            ),
          ),
          ButtonCircle(
            onTap: () => this._userBloc.signOut(),
            height: 40.0,
            width: 40.0,
            color: Color.fromRGBO(255, 255, 255, 0.7),
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.blue,
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }

}