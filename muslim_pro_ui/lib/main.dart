import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muslimproui/MyHomePage.dart';
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

        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => LoadingScreen(),
        '/home': (context) => MyHomePage(),
      },
    );
  }
}

class LoadingScreen extends StatefulWidget{

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void loadData(){

    Future.delayed(Duration(seconds: 3)).then((value){
      Navigator.pushReplacementNamed(context, '/home');
    });

  }
  @override
  void initState() {
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Assets/masjid.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.greenAccent.withOpacity(.7), Colors.green.withOpacity(.7),
                    ]
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('Assets/logo.png'),
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text('MUSLIM PRO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}