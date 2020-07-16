import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playstoreui/AppTile.dart';
import 'package:playstoreui/TopCarts.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with TickerProviderStateMixin{


  List<AppData> customizeYourdevice = [AppData(title: 'Facebook', size: '40', imageUrl: 'Assets/facebook.png'),
    AppData(title: 'OLX', size: '40', imageUrl: 'Assets/olx.png'),
    AppData(title: 'MX Player', size: '40', imageUrl: 'Assets/mxplayer.png'),
    AppData(title: 'Pinterest', size: '40', imageUrl: 'Assets/pinterest.png')];

  List<AppData> suggestedForYou = [AppData(title: 'WhatsApp Business', size: '40', imageUrl: 'Assets/whatsapp.png'),
    AppData(title: 'Teams', size: '40', imageUrl: 'Assets/teams.png')];

  List<AppData> musicPlayers = [AppData(title: 'YouTube', size: '40', imageUrl: 'Assets/youtube.jpg'),
    AppData(title: 'Canva', size: '40', imageUrl: 'Assets/canva.jpg')];

  List<AppData> translateThatLanguage = [AppData(title: 'Asphalt 8', size: '40', imageUrl: 'Assets/asphalt.jpg'),
    AppData(title: 'Video Editor', size: '40', imageUrl: 'Assets/video.png')];



  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 6, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(scaffoldKey: _scaffoldKey, tabController: tabController,),
        key: _scaffoldKey,
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            ListView(
              children: <Widget>[
                AppRack(appList: customizeYourdevice, rackTitle: 'Customize your device' ,),
                AppRack(appList: suggestedForYou, rackTitle: 'Suggested for you' ,),
                AppRack(appList: musicPlayers, rackTitle: 'Music players' ,),
                AppRack(appList: translateThatLanguage, rackTitle: 'Translate that language' ,),


              ],
            ),
            TopCharts(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
        drawer: Drawer(),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{

  double height;
  TabController tabController;
  GlobalKey<ScaffoldState> scaffoldKey;
  CustomAppBar({this.scaffoldKey, this.tabController, this.height = 130.0});

  @override
  State createState() {
    return CustomAppBarState();
  }
  @override
  Size get preferredSize => Size.fromHeight(height);
}

class CustomAppBarState extends State<CustomAppBar>{


  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: Card(
              elevation: 10.0,
              color: Colors.white,
              child: Container(
                height: widget.height,
                child: Row(

                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                      ),
                      onPressed: (){
                        widget.scaffoldKey.currentState.openDrawer();
                      },
                    ),
                    Expanded(
                      child: TextField(
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'Search for apps & games',
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.mic,
                        ),
                        onPressed: (){

                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        backgroundImage: AssetImage('Assets/asad.jpg'),
                        radius: 15.0,
                      ),
                    )
                  ],
                )
              )
            ),
          ),
        ),
        Container(
          child: TabBar(
            controller: widget.tabController,
            indicatorColor: Colors.green,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: 'For you',
              ),
              Tab(
                text: 'Top charts',
              ),
              Tab(
                text: 'Categories',
              ),
              Tab(
                text: "Editor's choice",
              ),
              Tab(
                text: 'Family',
              ),
              Tab(
                text: 'Early access',
              )
            ],
          ),
        )
      ],
    );
  }

}
