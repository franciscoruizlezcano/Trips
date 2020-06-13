import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/place/bloc/place_bloc.dart';
import 'package:trips/place/model/place.dart';
import 'package:trips/user/bloc/user_bloc.dart';
import 'package:trips/widget/button_submit.dart';
import 'package:trips/widget/card_image.dart';
import 'package:trips/widget/floating_action_button.dart';
import 'package:trips/widget/gradient_back.dart';
import 'package:trips/widget/header_appbar.dart';
import 'package:trips/widget/location_input.dart';
import 'package:trips/widget/text_input.dart';

// ignore: must_be_immutable
class AddPlaceScreen extends StatefulWidget{

  File image;

  AddPlaceScreen({Key key, this.image});

  @override
  _AddPlaceScreenState createState() {
    // TODO: implement createState
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends State<AddPlaceScreen>{

  GlobalKey _formKey = new GlobalKey();
  TextEditingController _controllerTitle = new TextEditingController();
  TextEditingController _controllerDescription = new TextEditingController();
  TextEditingController _controllerLocation = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    PlaceBloc placeBloc =  BlocProvider.of<PlaceBloc>(context);

    // TODO: implement build
    return Scaffold(
      body: Builder(
        builder: (BuildContext context){
          return Stack(
            children: [
              GradientBack(width: MediaQuery.of(context).size.width, height: 300.0, circle: true),
              HeaderAppbar(title: "Add new place", back: true, margin: EdgeInsets.only(top: 30.0, bottom: 10.0)),
              Form(
                key: this._formKey,
                child: Container(
                  margin: EdgeInsets.only(top: 80.0),
                  alignment: Alignment.centerLeft,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(top: 40.0, right: 20.0 ,left: 20.0),
                    children: [
                      CardImage(
                        height: 200.0,
                        width: MediaQuery.of(context).size.width,
                        pathImage: widget.image.path,
                        alignment: Alignment.bottomRight,
                        child: null,
                      ),
                      TextInput(
                        hintText: "Title",
                        textInputType: TextInputType.text,
                        controller: this._controllerTitle,
                        maxLines: 1,
                        margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
                      ),
                      TextInput(
                        hintText: "Description",
                        textInputType: TextInputType.multiline,
                        controller: this._controllerDescription,
                        maxLines: 5,
                        margin: EdgeInsets.only(bottom: 20.0),
                      ),
                      LocationInput(hintText: "Add location", controller: this._controllerLocation, margin: EdgeInsets.only(bottom: 20.0)),
                      ButtonSubmit(
                          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/2),
                          title: "Add place",
                          onPressed:(){
                            //1. Firebase storage
                            // url
                            String urlImage = "";
                            //ID user logged
                            userBloc.currentUser.then((FirebaseUser user){
                              if(user != null){
                                String uid = user.uid;
                                String path = uid + "/" + DateTime.now().toString() + ".jpg";
                                placeBloc.uploadFile(path, widget.image).then((StorageUploadTask storageUploadTask){
                                  storageUploadTask.onComplete.then((StorageTaskSnapshot snapshot){
                                    snapshot.ref.getDownloadURL().then((value){
                                      urlImage = value;
                                    });
                                  });
                                });
                              }
                            });
                            //2. Cloud firebase
                            placeBloc.updateData(
                                new Place(
                                  name: this._controllerTitle.text,
                                  description: this._controllerDescription.text,
                                  urlImage: urlImage,
                                  likes: 0,
                                )
                            ).whenComplete((){
                              Navigator.of(context).pop();
                            });
                          }
                      ),
                    ],
                  ),
                ),
              ),

            ],
          );
        },
      )
    );
  }

}