import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagramui/Post.dart';
import 'package:instagramui/User.dart';
import 'package:instagramui/UserImage.dart';

class HomeFeed extends StatelessWidget{

  List<Post> posts = [Post(user: User(username: 'john', imageUrl: 'Assets/john.jpg',
      storyAvailable: true), imageUrl: 'Assets/watch.jpg', caption: 'This watch is rocking the market. I will buy this IA. I will earn money, a hell a lot of money so that I can buyt it.This watch is rocking the market. I will buy this IA. I will earn money, a hell a lot of money so that I can buyt it.'),
    Post(user: User(username: 'john', imageUrl: 'Assets/john.jpg',
        storyAvailable: true), imageUrl: 'Assets/watch.jpg', caption: 'This watch is rocking the market. I will buy this IA. I will earn money, a hell a lot of money so that I can buyt it.This watch is rocking the market. I will buy this IA. I will earn money, a hell a lot of money so that I can buyt it.')];
  @override
  Widget build(BuildContext context){

    return Column(
      children:
        posts.map((post) => PostCard(key: UniqueKey(), post: post,)).toList(),
    );
  }
}

class PostCard extends StatefulWidget{

  Key key;
  Post post;
  PostCard({this.key, this.post});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {

  TextOverflow captionOverflow = TextOverflow.ellipsis;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      UserImage(
                        user: widget.post.user,
                        radiusImage: 21.0,
                        radiusStory: 23.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 8.0, 8.0, 8.0),
                        child: Text(widget.post.user.username, style: TextStyle(fontSize: 16.0),),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.more_vert
                )
              ],
            ),
            Image(
              fit: BoxFit.fitWidth,
              image: AssetImage(widget.post.imageUrl),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                            Icons.star,
                        )
                      ),
                      IconButton(
                          icon: Icon(
                              Icons.comment,
                          )
                      ),
                      IconButton(
                          icon: Icon(
                              Icons.send,
                          )
                      ),

                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.save
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 5.0, 10.0),
                  child: Text('4000 likes', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 5.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    overflow: captionOverflow,
                    maxLines: captionOverflow == TextOverflow.ellipsis? 2: null,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: '${widget.post.user.username} ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        TextSpan(text: '${widget.post.caption}', style: TextStyle(color: Colors.black)),
                      ]
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        captionOverflow = captionOverflow == TextOverflow.ellipsis ? TextOverflow.clip: TextOverflow.ellipsis;
                      });
                      },
                    child: Text(
                        captionOverflow == TextOverflow.ellipsis ? 'more': 'less',
                      style: TextStyle(color: Colors.grey)
                    ),
                  )
                ],
              ),
            )
          ],
        ),
    );
  }
}