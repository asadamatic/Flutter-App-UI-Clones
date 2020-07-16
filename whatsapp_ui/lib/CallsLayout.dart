import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappui/Data/CallData.dart';

class CallLayout extends StatelessWidget{

  List<CallData> calls = [CallData(name: 'Conor', time: 'Today, 8:00 pm', imageUrl: 'conor.jpeg', received: false, video: true),
    CallData(name: 'Dana', time: 'Today, 8:00 pm', imageUrl: 'dana.jpg', received: true, video: false),
    CallData(name: 'Tony', time: 'Today, 6:05 pm', imageUrl: 'tony.jpg', received: false, video: false),
    CallData(name: 'Justin', time: 'Today, 4:150 pm', imageUrl: 'justin.jpg', received: true, video: true)];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: calls.map((call) => CallTile(key: UniqueKey(), call: call,)).toList(),
        )
      ],
    );
  }
}

class CallTile extends StatefulWidget{

  CallData call;
  Key key;
  CallTile({this.key, this.call});

  @override
  _CallTileState createState() => _CallTileState();
}

class _CallTileState extends State<CallTile> {
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
                backgroundImage: AssetImage(widget.call.imageUrl),
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
                          TextSpan(text: widget.call.name, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold,)),
                        ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          widget.call.received ? Icons.call_received : Icons.call_made,
                          color: widget.call.received ? Colors.greenAccent : Colors.redAccent,
                        ),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: widget.call.time, style: TextStyle(color: Colors.white)),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              widget.call.video ? Icons.video_call : Icons.phone,
              color: Colors.greenAccent,
            ),
          )
        ],
      ),
    );
  }
}