import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trips/user/bloc/user_bloc.dart';
import 'package:trips/user/model/user.dart';
import 'package:trips/widget/button_green.dart';
import 'package:trips/widget/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/widget/navigation_bar.dart';

class SignInScreen extends StatefulWidget{

  @override
  State createState(){
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State<SignInScreen>{

  UserBloc _userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    this._userBloc = BlocProvider.of(context);
    return this._handleCurrentSession();
  }

  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: this._userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot --> data --> Object User
        if(!snapshot.hasData || snapshot.hasError){
          return signInGoogleUI();
        }else{
          return NavigationBar();
        }
      },
    );
  }

  Widget signInGoogleUI(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,circle: true,),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
            child: Column(
              children: [
                //Desbordamiento del texto
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 30.0,
                      left: 30.0,
                      right: 30.0
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Welcome. \nThis is Travel App",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 37.0
                      ),
                    ),
                  )
                ),
                ButtonGreen(
                  title: "Sign in with Gmail",
                  margin: EdgeInsets.only(
                    top: 30.0,
                    left: 30.0,
                    right: 30.0
                  ),
                  height: 60.0,
                  onTap: (){
                    _userBloc.signOut();
                    _userBloc.signIn().then((FirebaseUser user){
                      _userBloc.updateData(new User(uid: user.uid, name: user.displayName, email: user.email, photoUrl: user.photoUrl));
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}