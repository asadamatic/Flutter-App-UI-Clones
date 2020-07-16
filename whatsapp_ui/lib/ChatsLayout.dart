import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsappui/Data/ChatData.dart';

class ChatsLayout extends StatelessWidget{

  List<ChatData> chats = [ChatData(senderName: 'Conor', lastMessage: "let's fight Khabib.", imageUrl: 'conor.jpeg', time: '1:01 AM', mute: true),
    ChatData(senderName: 'Dana', lastMessage: "Hey Khabib, would you fight conor?", imageUrl: 'dana.jpg', time: '1:01 AM', mute: false),
    ChatData(senderName: 'Justin', lastMessage: "Hey Khabib, I am the interim champ!", imageUrl: 'justin.jpg', time: '1:01 AM', mute: false),
    ChatData(senderName: 'Tony', lastMessage: "we can't fight anymore :(", imageUrl: 'tony.jpg', time: '1:01 AM', mute: true),
    ChatData(senderName: 'GSP', lastMessage: "Dana won't let us fight!", imageUrl: 'gsp.jpg', time: '1:01 AM', mute: false),
    ChatData(senderName: 'Henry Cejudo', lastMessage: "Who's the best combat fighter of all time?", imageUrl: 'henry.jpg', time: '1:01 AM', mute: true),
    ChatData(senderName: 'Dillon Danis', lastMessage: "Let's fight this summer!", imageUrl: 'dillon.jpg', time: '1:01 AM', mute: true)];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: chats.map((chat) => ChatTile(key: UniqueKey(), chat: chat,)).toList(),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Text(
              'Archived',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1),
            ),
          ),
        )
      ],
    );
  }
}

class ChatTile extends StatefulWidget{

  ChatData chat;
  Key key;
  ChatTile({this.key, this.chat});
  @override
  State createState() {
    return _ChatTileState();
  }
}

class _ChatTileState extends State<ChatTile>{


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[800],
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: .4,
            )
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(widget.chat.imageUrl),
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
                          TextSpan(text: widget.chat.senderName, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold,)),
                        ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: widget.chat.lastMessage, style: TextStyle(color: Colors.white)),
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: widget.chat.time, style: TextStyle(color: Colors.grey, fontSize: 15.0,)),
                          ]
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        widget.chat.mute ? Icons.notifications_off : Icons.notifications,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}