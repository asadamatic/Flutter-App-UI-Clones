
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagramui/User.dart';

class UserImage extends StatelessWidget{

  User user;
  double radiusImage, radiusStory;
  UserImage({this.user, this.radiusImage, this.radiusStory});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.redAccent,
      radius: radiusStory,
      child: CircleAvatar(
        backgroundImage: AssetImage(user.imageUrl),
        radius: user.storyAvailable ? radiusImage: radiusStory,
      ),
    );
  }
}