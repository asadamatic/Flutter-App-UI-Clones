import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget{

  @override
  State createState() {
    return _CustomDrawerState();
  }
}

class _CustomDrawerState extends State<CustomDrawer>{

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[

          Container(
            color: Colors.amber,
            child: DrawerHeader(
              child: CircleAvatar(
                radius: 10.0,
                child: Image(
                  image: AssetImage('Assets/logo.png'),
                ),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          ListTile(
            title: Text('Categories'),
            leading: Icon(
                Icons.category
            ),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('My Orders'),
            leading: Icon(
                Icons.list
            ),
            trailing: CountBubble(key: UniqueKey(), count: 1,),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Wallet'),
            leading: Icon(
                Icons.account_balance_wallet
            ),
            trailing: CountBubble(key: UniqueKey(), count: 1,),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Refer & Earn'),
            leading: Icon(
                Icons.people
            ),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('About'),
            leading: Icon(
                Icons.info
            ),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Log out'),
            leading: Icon(
                Icons.all_out
            ),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class CountBubble extends StatefulWidget{

  int count;
  Key key;
  CountBubble({this.key, this.count});

  @override
  State createState() {
    return _CountBubbleState();
  }
}

class _CountBubbleState extends State<CountBubble>{


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 30.0,
      child: CircleAvatar(
        radius: 5.0,
        backgroundColor: Colors.red,
        child: Text('${widget.count}'),
      ),
    );
  }
}
