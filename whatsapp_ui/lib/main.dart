import 'package:flutter/material.dart';
import 'package:whatsappui/CallsLayout.dart';
import 'package:whatsappui/ChatsLayout.dart';
import 'package:whatsappui/Data/ChatData.dart';
import 'package:whatsappui/StatusLayout.dart';

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
        primaryColor: Colors.grey[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => MyHomePage(title: 'WhatsApp',),
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  TabController tabController;
  IconData floatingIcon = Icons.chat;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 3, initialIndex: 0);
    tabController.addListener(() {
      setState(() {
        floatingIcon = tabController.index == 0 ? Icons.chat : tabController.index == 1 ? Icons.camera_alt : Icons.phone;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text(widget.title),
        actionsIconTheme: IconThemeData(
          color: Colors.grey,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              icon: Icon(
                  Icons.search
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(
                  Icons.more_vert
              ),
              onPressed: () {},
            ),
          )
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          ChatsLayout(),
          StatusLayout(),
          CallLayout(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(
          floatingIcon,
        ),
      ),
    );
  }
}
