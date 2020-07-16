import 'package:careemui/OptionsScreen.dart';
import 'package:careemui/TransportHome.dart';
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
        primaryColor: Color(0xff499d3a),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => MyHomePage(),
        '/Transport': (context) => TransportHome(),
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

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: _selectedIndex == 0 ? OptionsScreen() : _selectedIndex == 1 ? Container() : Container(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          selectedIconTheme: IconThemeData(
            color: Colors.greenAccent,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.grey,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.payment,
              ),
              title: Text('PkR 0'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text('Profile'),
            )
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{


  @override
  State createState() {
    return CustomAppBarState();
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);

}

class CustomAppBarState extends State<CustomAppBar>{


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(5.0, 5.0, 50.0, 0.0),
            child: Image(
              image: AssetImage('careem.png'),
              height: 30.0,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(
                  Icons.attach_money,
                  color: Colors.amber,
                  size: 15.0,
                ),
                Text('1,156 pts', style: TextStyle(fontWeight: FontWeight.bold),),
                IconButton(
                  color: Colors.grey,
                  onPressed: () {},
                  icon: Icon(
                      Icons.play_arrow,
                    size: 20.0,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}