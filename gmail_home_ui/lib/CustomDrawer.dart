import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gmailhomeui/Email.dart';

class CustomDrawer extends StatefulWidget{

  List<Email> allEmails, primaryEmails, socialEmails, promotionalEmails, updatesEmails;
  final Function updateEmailList;
  CustomDrawer({this.allEmails, this.primaryEmails, this.socialEmails, this.promotionalEmails, this.updatesEmails, @required this.updateEmailList});
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
            height: 65.0,
            child: DrawerHeader(
              child: Text('Gmail', style: TextStyle(fontSize: 24.0, color: Colors.red),),
            ),
          ),
          ListTile(
            leading: Icon(
                Icons.inbox
            ),
            title: Text('All Inboxes'),
            trailing: CustomIcon(key: UniqueKey(), count: 2),
            onTap: (){
              widget.updateEmailList(widget.allEmails);
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
                Icons.email
            ),
            title: Text('Primary'),
            trailing: CustomIcon(key: UniqueKey(), count: 1),
            onTap: (){
              widget.updateEmailList(widget.primaryEmails);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
                Icons.people
            ),
            title: Text('Social'),
            onTap: (){
              widget.updateEmailList(widget.socialEmails);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
                Icons.label
            ),
            title: Text('Promotions'),
            trailing: CustomIcon(key: UniqueKey(), count: 1),
            onTap: (){
              widget.updateEmailList(widget.promotionalEmails);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
                Icons.update
            ),
            title: Text('Updates'),
            onTap: (){
              widget.updateEmailList(widget.updatesEmails);
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
            child: Text('ALL LABELS',),
          ),
          ListTile(
            leading: Icon(
                Icons.star
            ),
            title: Text('Starred'),
            trailing: Text('1'),
            onTap: (){
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(
                Icons.snooze
            ),
            title: Text('Snoozed'),
            trailing: Text(''),
            onTap: (){
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(
                Icons.label_important
            ),
            title: Text('Important'),
            trailing: Text(''),
            onTap: (){
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(
                Icons.send
            ),
            title: Text('Sent'),
            trailing: Text('1'),
            onTap: (){
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(
                Icons.schedule
            ),
            title: Text('Scheduled'),
            trailing: Text(''),
            onTap: (){
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(
                Icons.account_box
            ),
            title: Text('Outbox'),
            trailing: Text('13'),
            onTap: (){
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(
                Icons.drafts
            ),
            title: Text('Drafts'),
            trailing: Text('4'),
            onTap: (){
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(
                Icons.mail
            ),
            title: Text('All mail'),
            trailing: Text(''),
            onTap: (){
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(
                Icons.block
            ),
            title: Text('Spam'),
            trailing: Text(''),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
                Icons.shopping_basket
            ),
            title: Text('Bin'),
            trailing: Text(''),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 5.0),
            child: Text('GOOGLE APPS',),
          ),
          ListTile(
            leading: Icon(
                Icons.calendar_today
            ),
            title: Text('Calendar'),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
                Icons.contacts
            ),
            title: Text('Contacts'),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
                Icons.settings
            ),
            title: Text('Settings'),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
                Icons.question_answer
            ),
            title: Text('Help and feedback'),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class CustomIcon extends StatefulWidget{

  int count;
  Key key;
  CustomIcon({this.key, this.count});
  @override
  State createState() {
    return _CustomIconState(count: this.count);
  }
}

class _CustomIconState extends State<CustomIcon> {

  int count;

  _CustomIconState({this.count});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 12.0,
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      child: Text('$count'),

    );
  }
}