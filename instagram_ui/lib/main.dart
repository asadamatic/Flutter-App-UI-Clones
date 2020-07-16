import 'package:flutter/material.dart';
import 'package:instagramui/HomeFeed.dart';
import 'package:instagramui/SearchFeed.dart';
import 'package:instagramui/Story.dart';
import 'package:instagramui/User.dart';
import 'package:instagramui/UserImage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => MyHomePage(title: 'Instagram',),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 5);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold,),),
        leading: GestureDetector(
          child: Icon(
            Icons.camera_alt,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              child: Icon(
                Icons.tv,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              child: Icon(
                Icons.send,
              ),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          ListView(
            children: <Widget>[
              StoryView(),
              HomeFeed()
            ],
          ),
          SearchFeed(),
          Container(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: TabBar(

        controller: tabController,
        tabs: [
          Tab(
            icon: new Icon(Icons.home),
          ),
          Tab(
            icon: new Icon(Icons.search),
          ),
          Tab(
            icon: new Icon(Icons.add),
          ),
          Tab(icon: new Icon(Icons.notifications),
          ),
          Tab(icon: new Icon(Icons.person),
          )
        ],
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.redAccent,
      ),
    );
  }
}


class StoryView extends StatelessWidget{

  List<Story> stories = [Story(user: User(username: 'john', imageUrl: 'Assets/john.jpg', storyAvailable: false)),
    Story(user: User(username: 'wick', imageUrl: 'Assets/wick.jpg', storyAvailable: false)),
    Story(user: User(username: 'conor', imageUrl: 'Assets/conor.jpg', storyAvailable: true)),
    Story(user: User(username: 'dana', imageUrl: 'Assets/dana.jpg', storyAvailable: false)),
    Story(user: User(username: 'jones', imageUrl: 'Assets/jones.jpg', storyAvailable: true)),
    Story(user: User(username: 'khabib', imageUrl: 'Assets/khabib.jpg', storyAvailable: false))];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: stories.map((story) => StoryCard(story: story,)).toList(),
      ),
    );
  }
}

class StoryCard extends StatelessWidget{

  Story story;
  StoryCard({this.story});
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          UserImage(
           user: story.user,
            radiusStory: 30.0,
            radiusImage: 28.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: Text(story.user.username),
          )
        ],
      ),
    );
  }
}