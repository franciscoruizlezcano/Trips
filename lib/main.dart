import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/user/bloc/user_bloc.dart';
import 'package:trips/user/ui/screen/signin_screen.dart';
import 'package:trips/widget/navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserBloc(),
      child: MaterialApp(
        title: 'Trips App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Lato",
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SignInScreen(),
        /*home: Scaffold(
          body: NavigationBar(),
        )*/
      )
    );
  }
}
