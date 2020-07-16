import 'package:fiverrui/Categories.dart';
import 'package:fiverrui/SellerDetails.dart';
import 'package:fiverrui/SellerProfile.dart';
import 'package:flutter/material.dart';

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
        accentColor: Colors.greenAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'asadhameed_'),
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

  List<Widget> screens;
  TabController controller;
  int selectedIndex = 0;
  Widget appBarTitle = Text('Categories');
  IconData searchIcon = Icons.search;
  InputDecoration searchDecoration = InputDecoration(hintText: 'Searc here...');
  final globalKey = GlobalKey<CategoriesState>();

  void onItemChanged(int index){

    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 2, initialIndex: 0);
    screens = [SellerDetails(), Container(), Categories(key: globalKey, controller: controller,), Container(), SellerProfile()];

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: selectedIndex == 2 ? appBarTitle : Text(selectedIndex == 0 ? 'asadhameed_': selectedIndex == 1 ? 'Inbox': selectedIndex == 2 ? 'Categories': selectedIndex == 3 ? 'Notifications': selectedIndex == 4? '' : '',),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: selectedIndex == 0 ? CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('user.jpg'),
            ): selectedIndex == 1 ? IconButton(icon: Icon(Icons.category),): selectedIndex == 2 ? IconButton(icon: Icon(searchIcon), onPressed: (){
              setState(() {
                searchIcon = searchIcon == Icons.search ? Icons.close : Icons.search;
                appBarTitle = searchIcon == Icons.search ? Text('Categories') : TextField(decoration: searchDecoration, onChanged: (value){
                  globalKey.currentState.filterList(value);
                },);
                if (searchIcon == Icons.search){
                  globalKey.currentState.closeSearch();
                }
              });
            },) : selectedIndex == 3 ? null: selectedIndex == 4? IconButton(icon: Icon(Icons.settings),) : null,
          )
        ],
        bottom: selectedIndex == 2 ? TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              text: 'CATEGORIES',
            ),
            Tab(
              text: 'INTERESTS',
            )
          ],
        ): null,
      ),
      body: Container(
        child: screens.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        unselectedIconTheme: IconThemeData(
          color: Colors.black,
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.greenAccent,
        ),
        onTap: (index){
          onItemChanged(index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text('')
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.mail,
              ),
              title: Text('')
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.receipt,
              ),
              title: Text('')
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
              ),
              title: Text('')
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text('')
          )
        ],
      ),
    );
  }
}

