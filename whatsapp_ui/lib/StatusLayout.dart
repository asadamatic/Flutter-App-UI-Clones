import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappui/Data/StatusData.dart';

class StatusLayout extends StatelessWidget{

  List<StatusData> statuses = [StatusData(name: 'Conor', time: 'Today, 8:00 pm', imageUrl: 'conor.jpeg'),
    StatusData(name: 'Dana', time: 'Today, 8:00 pm', imageUrl: 'dana.jpg'),
    StatusData(name: 'Tony', time: 'Today, 6:05 pm', imageUrl: 'tony.jpg'),
    StatusData(name: 'Justin', time: 'Today, 4:150 pm', imageUrl: 'justin.jpg')];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        StatusTile(status: StatusData(name: "My Status", imageUrl: 'khabib.jpg', time: 'Tap to add status update'),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Updates', style: TextStyle(color: Colors.grey[100], fontWeight: FontWeight.bold, fontSize: 16.0),),
        ),
        Column(
          children: statuses.map((status) => StatusTile(key: UniqueKey(), status: status,)).toList(),
        )
      ],
    );
  }
}

class StatusTile extends StatefulWidget{

  StatusData status;
  Key key;
  StatusTile({this.key, this.status});

  @override
  _StatusTileState createState() => _StatusTileState();
}

class _StatusTileState extends State<StatusTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[800],

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              radius: 30.0,
              child: CircleAvatar(
                radius: 28.0,
                backgroundImage: AssetImage(widget.status.imageUrl),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: widget.status.name, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold,)),
                        ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: widget.status.time, style: TextStyle(color: Colors.white)),
                          ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}