import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gmailhomeui/CustomDrawer.dart';
import 'package:gmailhomeui/Email.dart';

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
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Email> allEmails = [Email(nameSender: 'Talha', subject: 'Flutter', content: 'Flutter is great', date: '1 May'),
    Email(nameSender: 'MQ', subject: 'Flutter', content: 'Flutter is great', date: '4 May'),
    Email(nameSender: 'Ahsan', subject: 'Flutter', content: 'Flutter is great', date: '1 May'),
    Email(nameSender: 'Raees', subject: 'Flutter', content: 'Flutter is great', date: '3 May'),
    Email(nameSender: 'Usman', subject: 'Flutter', content: 'Flutter is great', date: '4 May')];

  List<Email> primaryEmails = [Email(nameSender: 'MQ', subject: 'Flutter', content: 'Flutter is great', date: '4 May'),];
  List<Email> socialEmails = [Email(nameSender: 'Ahsan', subject: 'Flutter', content: 'Flutter is great', date: '4 May'),];
  List<Email> promotionalEmails = [Email(nameSender: 'Raees', subject: 'Flutter', content: 'Flutter is great', date: '4 May'),];
  List<Email> updatesEmails = [Email(nameSender: 'Talha', subject: 'Flutter', content: 'Flutter is great', date: '1 May'),];


  List<Email> displayEmails = [];
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: FloatingSearchBar.builder(
        drawer: CustomDrawer(allEmails: this.allEmails, primaryEmails: this.primaryEmails,
          socialEmails: this.socialEmails, promotionalEmails: this.promotionalEmails,
          updatesEmails: this.updatesEmails,
          updateEmailList: (List email){
            setState(() {
              displayEmails = email;
            });
          },
        ),
          itemBuilder: (BuildContext context, int index){
            return EmailCard(key: UniqueKey(), email: displayEmails[index],);
          },
          itemCount: displayEmails.length),
    );
  }
}

class EmailCard extends StatefulWidget{

  Email email;
  Key key;
  EmailCard({this.key, this.email});
  @override
  State createState() {
    return _EmailCardState(email: this.email);
  }
}

class _EmailCardState extends State<EmailCard>{

  Email email;
  _EmailCardState({this.email});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(right: 8.0, left: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 10.0, 0.0, 10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[800],
                  child: Text(email.nameSender.substring(0, 1), style: TextStyle(color: Colors.white),),
                  radius: 28.0
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
                      child: Text(email.nameSender, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0), ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
                      child: Text(email.subject, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0), ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
                      child: Text(email.content, style: TextStyle(fontSize: 14.0), ),
                    ),

                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(email.date),
                )
            )
          ],
        ),
      ),
    );
  }
}
