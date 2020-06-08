import 'package:flutter/material.dart';
import 'package:trips/user/ui/widget/user_experience.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Users",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            children: <Widget>[
              UserExperience(
                fullname: "Test",
                experience: 10,
                pathImage: "assets/images/people.jpg",
              ),
              Divider(height: 5, color: Colors.grey,),
              UserExperience(
                fullname: "Test2",
                experience: 10,
                pathImage: "assets/images/people.jpg",
              ),
              Divider(height: 5, color: Colors.grey,),
              UserExperience(
                fullname: "Test3",
                experience: 10,
                pathImage: "assets/images/people.jpg",
              ),
              Divider(height: 5, color: Colors.grey,),
              UserExperience(
                fullname: "Test",
                experience: 10,
                pathImage: "assets/images/people.jpg",
              ),
              Divider(height: 5, color: Colors.grey,),
              UserExperience(
                fullname: "Test2",
                experience: 10,
                pathImage: "assets/images/people.jpg",
              ),
              Divider(height: 5, color: Colors.grey,),
              UserExperience(
                fullname: "Test3",
                experience: 10,
                pathImage: "assets/images/people.jpg",
              ),
            ],
          )
        ],
      ),
    );
  }
}
