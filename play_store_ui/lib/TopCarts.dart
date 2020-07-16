import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:playstoreui/AppTile.dart';

class TopCharts extends StatefulWidget{

  @override
  State createState() {
    return TopChartsState();
  }
}

class TopChartsState extends State<TopCharts> with TickerProviderStateMixin{

  List<AppData> apps = [AppData(title: 'Facebook', size: '40', imageUrl: 'Assets/facebook.png', category: 'social', rating: 4.5),
    AppData(title: '8 Ball Pool', size: '40', imageUrl: 'Assets/8ballpool.jpg', category: 'social', rating: 4.5),
    AppData(title: 'Jazz World', size: '40', imageUrl: 'Assets/jazz.jpg', category: 'social', rating: 4.5),
    AppData(title: 'Video Editor', size: '40', imageUrl: 'Assets/video.png', category: 'social', rating: 4.5)];

  TabController tabController;
  bool showInstalledApps = false;
  int tabIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 4, initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 15.0, 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Show installed apps', style: TextStyle(color: Colors.grey, fontSize: 16.0),),
              Switch(value: showInstalledApps, activeColor: Colors.green, onChanged: (value){
                setState(() {
                  showInstalledApps = value;
                });
              },)
            ],
          ),
        ),
        Container(
          child: TabBar(
            onTap: (index){
              setState(() {
                tabIndex = index;
              });
            },
            indicatorPadding: EdgeInsets.symmetric(horizontal: 15.0,),
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.white,
            indicator: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(35.0),
            ),
            controller: tabController,
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: 'Top free',
              ),
              Tab(
                text: 'Top Grossing',
              ),
              Tab(
                text: 'Trending',
              ),
              Tab(
                text: 'Top paid',
              ),
            ],
          ),
        ),
        Container(
          child: tabIndex == 0 ?
              Column(
                children: apps.asMap().entries.map((app) => AppTile(app: app.value, rank: app.key+1,)).toList(),
              ) : tabIndex == 1 ?
              Column(
                children: apps.asMap().entries.map((app) => AppTile(app: app.value, rank: app.key+1,)).toList(),
              ): tabIndex == 2 ?
              Column(
                children: apps.asMap().entries.map((app) => AppTile(app: app.value, rank: app.key+1,)).toList(),
              ) : tabIndex == 3 ?
              Column(
                children: apps.asMap().entries.map((app) => AppTile(app: app.value, rank: app.key+1,)).toList(),
              ): Container(),


        ),
      ],
    );
  }
}

class AppTile extends StatelessWidget{

  AppData app;
  int rank;
  AppTile({this.app, this.rank});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('$rank'),
          ),
          Container(
            width: 100.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(app.imageUrl,),

                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.circular(15.0)
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10.0, right: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(app.title, maxLines: 1, overflow: TextOverflow.ellipsis,),
                  Text(app.category),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('${app.rating}'),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text('${app.size} MB'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}