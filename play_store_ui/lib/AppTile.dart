import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppData{
  String title, size, imageUrl, category;
  double rating;
  AppData({this.title, this.size, this.imageUrl, this.category, this.rating});
}
class AppRack extends StatefulWidget{


  List<AppData> appList;
  String rackTitle;
  AppRack({this.appList, this.rackTitle});
  @override
  State createState() {
    return AppRackState();
  }
}

class AppRackState extends State<AppRack>{


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 10.0, left: 15.0),
            child: Text(widget.rackTitle, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
          ),
          Container(
            height: 190.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: widget.appList.map((app) => AppTile(app: app,)).toList(),
            ),
          )
        ],
      ),
    );
  }
}
class AppTile extends StatelessWidget{

  AppData app;
  AppTile({this.app});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
      width: 100.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 15,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(app.imageUrl,),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: app.title, style: TextStyle(color: Colors.grey))
                  ]
                ),
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Text('${app.size} MB', style: TextStyle(color: Colors.grey),))
        ],
      ),
    );
  }
}