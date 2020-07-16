import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SellerProfile extends StatefulWidget{


  @override
  State createState() {
    return _SellerProfileState();
  }
}

class _SellerProfileState extends State<SellerProfile>{


  bool sellerModeEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
            color: sellerModeEnabled ? Colors.black54 : Colors.greenAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('user.jpg'),
                  radius: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  child: Text('asadhameed_', style: TextStyle(fontSize: 18.0, color: Colors.white),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      Text('My personal balance: ', style: TextStyle(fontSize: 16.0, color: Colors.white),),
                      Text('PKR', style: TextStyle(fontSize: 16.0, color: Colors.white),),
                      Text('2,065.81', style: TextStyle(fontSize: 16.0, color: Colors.white),),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 15.0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.credit_card,
                                color: Colors.greenAccent,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text('Seller mode', style: TextStyle(fontSize: 18.0, color: Colors.black),),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: sellerModeEnabled,
                          onChanged: (value){
                            setState(() {
                              sellerModeEnabled = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        sellerModeEnabled ? OptionsList() : OptionsListBuyer()
      ],
    );
  }
}

class OptionsList extends StatefulWidget{

  @override
  State createState() {
    return _OptionsListState();
  }
}

class _OptionsListState extends State<OptionsList> {

  bool onlineModeEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 0.0),
                child: Text('Seller mode', style: TextStyle(fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),),
              ),
              ListTile(leading: Icon(Icons.payment),
                  title: Text('Earnings',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),)),
              ListTile(leading: Icon(Icons.receipt),
                  title: Text('Buyer requests',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),)),
              ListTile(leading: Icon(Icons.local_offer),
                  title: Text('Offer templates',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),)),
              ListTile(leading: Icon(Icons.notifications),
                  title: Text('Promote my gigs',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),)),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 0.0),
                child: Text('General', style: TextStyle(fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),),
              ),
              ListTile(leading: Icon(Icons.person),
                  title: Text('My Profile',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),)),
              ListTile(
                leading: Icon(Icons.receipt),
                title: Text('Online Status',
                  style: TextStyle(fontSize: 17.0, color: Colors.black),),
                trailing: Switch(
                  value: onlineModeEnabled, onChanged: (value) {
                  setState(() {
                    onlineModeEnabled = value;
                  });
                },),),
              ListTile(leading: Icon(Icons.payment),
                  title: Text('Payments',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),)),
              ListTile(leading: Icon(Icons.send),
                  title: Text('Invite friends',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),)),
              ListTile(leading: Icon(Icons.help),
                  title: Text('Support',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),))
            ],
          ),
        ],
      ),
    );
  }
}

class OptionsListBuyer extends StatefulWidget{

  @override
  State createState() {
    return _OptionsListBuyerState();
  }
}

class _OptionsListBuyerState extends State<OptionsListBuyer> {

  bool onlineModeEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 0.0),
                child: Text('My Fiverr', style: TextStyle(fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),),
              ),
              ListTile(leading: Icon(Icons.save),
                  title: Text('Saved gigs',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),)),
              ListTile(leading: Icon(Icons.info),
                  title: Text('My interest',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),)),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 0.0),
                child: Text('Buying', style: TextStyle(fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),),
              ),
              ListTile(leading: Icon(Icons.receipt),
                  title: Text('Manage orders',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),)),
              ListTile(leading: Icon(Icons.add_alert),
                  title: Text('Post a request',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),)),
              ListTile(leading: Icon(Icons.queue),
                  title: Text('Manage requests',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),)),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 0.0),
                child: Text('General', style: TextStyle(fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),),
              ),
              ListTile(leading: Icon(Icons.person),
                  title: Text('My Profile',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),)),
              ListTile(
                leading: Icon(Icons.receipt),
                title: Text('Online Status',
                  style: TextStyle(fontSize: 17.0, color: Colors.black),),
                trailing: Switch(
                  value: onlineModeEnabled, onChanged: (value) {
                  setState(() {
                    onlineModeEnabled = value;
                  });
                },),),
              ListTile(leading: Icon(Icons.payment),
                  title: Text('Payments',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),)),
              ListTile(leading: Icon(Icons.send),
                  title: Text('Invite friends',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),)),
              ListTile(leading: Icon(Icons.help),
                  title: Text('Support',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),))
            ],
          ),
        ],
      ),
    );
  }
}





