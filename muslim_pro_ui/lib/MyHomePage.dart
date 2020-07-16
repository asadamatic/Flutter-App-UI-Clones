import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hijri/umm_alqura_calendar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static DateTime time =  DateTime.now();
  static String formattedDate =  DateFormat('EEE d MMM').format(time);
  static String formattedTime = DateFormat.jm().format(time);
  static UmmAlquraCalendar islamicTime =  UmmAlquraCalendar.fromDate(time);
  static String dayOfMonth = islamicTime.hDay.toString();
  static String nameOfMonth = islamicTime.shortMonthName.toString();
  static String islamicYear = islamicTime.hYear.toString();
  static String islamicDate = dayOfMonth + ' ' + nameOfMonth + ' ' + islamicYear + ' AH';
  void getTime() {
    setState(() {
      time =  DateTime.now();
      formattedDate =  DateFormat('EEE d MMM').format(time);
      formattedTime =  DateFormat.jm().format(time);
      islamicTime =  UmmAlquraCalendar.fromDate(time);
      dayOfMonth = islamicTime.hDay.toString();
      nameOfMonth = islamicTime.longMonthName.toString();
      islamicYear = islamicTime.hYear.toString();
      islamicDate = dayOfMonth + ' ' + nameOfMonth + ' ' + islamicYear + ' AH';

    });
  }
  Widget appBarTitle = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(formattedDate, style: TextStyle(fontSize: 16.0),),
      Text(islamicDate, style: TextStyle(fontSize: 12.0),),
    ],
  );
  Widget appBarTitleCollapsed = Hero(
    tag: 'time',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Dhuhr', style: TextStyle(fontSize: 12.0),),
        Text(formattedTime, style: TextStyle(fontSize: 18.0),),
      ],
    ),
  );
  double appBarHeight = 200.0;

  List<PrayerData> prayers = [PrayerData(name: 'Fajr', time: DateTime.now(), alarmEnabled: true),
    PrayerData(name: 'Sunrise', time: DateTime.now(), alarmEnabled: true),
    PrayerData(name: 'Dhuhr', time: DateTime.now(), alarmEnabled: false),
    PrayerData(name: 'Asr', time: DateTime.now(), alarmEnabled: true),
    PrayerData(name: 'Maghrib', time: DateTime.now(), alarmEnabled: true),
    PrayerData(name: "Isha'a", time: DateTime.now(), alarmEnabled: false)];
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) { getTime(); });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 2.5),
                    child: IconButton(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 2.5),
                    child: IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        )
                    ),
                  ),
                ],
                title: appBarHeight == 300.0 ? appBarTitle: appBarTitleCollapsed,
                pinned: true,
                expandedHeight: 300.0,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints){
                    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
                      appBarHeight = constraints.biggest.height;
                    }));

                    return appBarHeight == 300.0 ? FlexibleSpaceBar(
                      centerTitle: true,
                      title: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Hero(
                                    tag: 'time',
                                    child: Column(
                                      children: <Widget>[
                                        Text('Dhuhr', style: TextStyle(fontSize: 12.0),),
                                        Text(formattedTime, style: TextStyle(fontSize: 18.0),),
                                      ],
                                    ),
                                  ),
                                  Text('Now', style: TextStyle(fontSize: 12.0),)
                                ],
                              ),

                            ),
                            Container(
                              margin: EdgeInsets.all(5.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.location_on,
                                              size: 14.0,
                                              color: Colors.white,
                                            ),
                                            Text('Pakistan', style: TextStyle(fontSize: 14.0),)
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right: 5.0),
                                              child: Icon(
                                                Icons.volume_up,
                                                size: 14.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 5.0),
                                              child: Icon(
                                                Icons.share,
                                                size: 14.0,
                                                color: Colors.white,
                                              ),
                                            ),

                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Card(
                                    elevation: 10.0,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: CategoryTile(title: 'Duas', imageUrl: 'Assets/dua.png')),
                                        Expanded(
                                            child: CategoryTile(title: 'Inspiration', imageUrl: 'Assets/inspiration.png')),
                                        Expanded(
                                            child: CategoryTile(title: 'Calendar', imageUrl: 'Assets/calendar.png')),
                                        Expanded(
                                            child: CategoryTile(title: 'Community', imageUrl: 'Assets/community.png')),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      background: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.asset('Assets/mosque.jpg', fit: BoxFit.cover,),
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.greenAccent.withOpacity(.6), Colors.green[900].withOpacity(.6)]
                                )
                            ),
                          )
                        ],
                      ),
                    ) : FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.asset('Assets/mosque.jpg', fit: BoxFit.cover,),
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.greenAccent.withOpacity(.6), Colors.green[900].withOpacity(.6)]
                                )
                            ),
                          )
                        ],
                      ),
                      title: Text(''),
                    );
                  },
                )
            ),
                SliverList(
                      delegate: SliverChildListDelegate(
                      [
                        Card(
                          elevation: 10.0,
                          margin: EdgeInsets.all(10.0),
                          child: Column(
                            children: prayers.map((prayer) => PrayerTile(prayerData: prayer,)).toList(),
                          ),
                        ),
                        Container(
                          height: 100,
                        ),
                        Container(
                          height: 100,
                        ),
                        Container(
                          height: 100,
                        ),
                        Container(
                          height: 100,
                        ),
                        Container(
                          height: 100,
                        ),
                      ],

                      ),
                ),
          ],
        ),

      ),
    );
  }
}

class PrayerData{

  String name;
  DateTime time;
  bool alarmEnabled;

  PrayerData({this.name, this.time, this.alarmEnabled});

}

class PrayerTile extends StatefulWidget{

  PrayerData prayerData;
  PrayerTile({this.prayerData});

  @override
  State createState() {
    return PrayerTileState();
  }
}

class PrayerTileState extends State<PrayerTile>{


  @override
  Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0)
        ),
        padding: EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(widget.prayerData.name),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text(DateFormat.jm().format(widget.prayerData.time)),
                  IconButton(
                    icon: Icon(
                      widget.prayerData.alarmEnabled ?  Icons.notifications : Icons.notifications_off,
                    ),
                    onPressed: (){
                      setState(() {
                        widget.prayerData.alarmEnabled = widget.prayerData.alarmEnabled ? false : true;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      );
  }
}

class CategoryTile extends StatelessWidget{

  String title, imageUrl;
  CategoryTile({this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(vertical: 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.greenAccent,
            child: Image(
              image: AssetImage(imageUrl,),
              height: 28,
            ),
            radius: 17.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 4.0, right: 4.0),
            child: Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 9.0),),
          )
        ],

      ),
    );
  }
}
