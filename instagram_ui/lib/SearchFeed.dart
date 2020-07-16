import 'package:flutter/cupertino.dart';
import 'package:instagramui/Post.dart';
import 'package:instagramui/User.dart';

class SearchFeed extends StatelessWidget{

  List<Post> posts = [Post(user: User(username: 'john', imageUrl: 'Assets/john.jpg',
      storyAvailable: true), imageUrl: 'Assets/watch.jpg', caption: 'This watch is rocking the market. I will buy this IA. I will earn money, a hell a lot of money so that I can buyt it.This watch is rocking the market. I will buy this IA. I will earn money, a hell a lot of money so that I can buyt it.'),
    Post(user: User(username: 'john', imageUrl: 'Assets/john.jpg',
        storyAvailable: true), imageUrl: 'Assets/watch.jpg', caption: 'This watch is rocking the market. I will buy this IA. I will earn money, a hell a lot of money so that I can buyt it.This watch is rocking the market. I will buy this IA. I will earn money, a hell a lot of money so that I can buyt it.')];
  @override
  Widget build(BuildContext context) {

    return GridView.count(crossAxisCount: 3,
    children:
      posts.map((post) => Image.asset(post.imageUrl)).toList(),
    );
  }
}