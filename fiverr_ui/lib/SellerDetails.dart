import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SellerDetails extends StatefulWidget{

  @override
  State createState() {
    return _SellerDetailsState();
  }
}

class _SellerDetailsState extends State<SellerDetails>{


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 10.0),
          color: Colors.grey[900],
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Standards to maintain', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),),
                          Icon(Icons.help, color: Colors.white,)
                        ],
                      ),
                    ),
                    MySellerDetailsWidget(title: 'Seller level', detail: 'No level',),
                    MySellerDetailsWidget(title: 'Next evaluation', detail: 'Jun 15, 2020',),
                    MySellerDetailsWidget(title: 'Response time', detail: '1 hour',),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: PerformanceTile(title: 'Response rate', performance: 100,)),
                    Expanded(child: PerformanceTile(title: 'Order completion', performance: 100,)),
                    Expanded(child: PerformanceTile(title: 'On-time delivery', performance: 100,)),
                    Expanded(child: PerformanceTile(title: 'Positive rating', performance: 4.5,)),
                  ],
                ),
              ),
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey[400],
                      )
                    )
                  ),
                  margin: EdgeInsets.only(top: 15.0, ),
                  padding: EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Next level requirements', style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold, color: Colors.white),),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Earnings', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.grey[600]),),
                    Text('View details', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.green),)
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.all(10.0),
                elevation: 10.0,
                child: Column(
                  children: <Widget>[
                    EarningsTile(firstTitle: 'Personal balance', firstEarnings: 0.0, secondTitle: 'Earnings in June', secondEarnings: 0,),
                    EarningsTile(firstTitle: 'Avg. selling price', firstEarnings: 0.0, secondTitle: 'Active orders', secondEarnings: 0,),
                    EarningsTile(firstTitle: 'Pending clearance', firstEarnings: 0.0, secondTitle: 'Cancelled orders', secondEarnings: 0,),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('To-Dos', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.grey[600]),),
              ),

              Card(
                margin: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
                elevation: 10.0,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 15.0, 20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('No Unread Messages', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.grey[900]),),
                            Text('Your response time is great!, keep up the good work', style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          child: Text('1', style: TextStyle(fontSize: 13.0, color: Colors.grey[700]),),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class EarningsTile extends StatelessWidget{

  String firstTitle, secondTitle;
  double firstEarnings, secondEarnings;

  EarningsTile({this.firstTitle, this.firstEarnings, this.secondTitle, this.secondEarnings});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('$firstTitle', style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),),
                Text('$firstEarnings', style: TextStyle(fontSize: 20.0, color: Colors.grey[800]),)
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('$secondTitle', style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),),
                Text('$secondEarnings', style: TextStyle(fontSize: 20.0, color: Colors.grey[800]),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PerformanceTile extends StatelessWidget{

  String title;
  double performance;
  PerformanceTile({this.title, this.performance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.greenAccent,
            radius: 31.0,
            child: CircleAvatar(
              backgroundColor: Colors.grey[900],
              radius: 29.5,
              child: title == 'Positive rating' ? Text('$performance', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),) : Text('$performance%', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '$title', style: TextStyle(fontSize: 16.0, color: Colors.white),)
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MySellerDetailsWidget extends StatelessWidget{

  String title, detail;
  MySellerDetailsWidget({this.title, this.detail});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('$title', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),),
          Text('$detail', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: title == 'Response time' ? Colors.green: Colors.grey),),
        ],
      ),
    );
  }
}