
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TransportHome extends StatefulWidget{
  TransportHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TransportHomeState createState() => _TransportHomeState();
}

class _TransportHomeState extends State<TransportHome> {

  Completer<GoogleMapController> _mapController = Completer();
  static const LatLng _center = const LatLng(33.6343576, 73.1231582);
  MapType _mapType = MapType.normal;
  void _onMapCreated(GoogleMapController controller){
    _mapController.complete(controller);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Select pickup'),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: <Widget>[

          GoogleMap(
            onMapCreated: _onMapCreated,
            mapType: _mapType,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            zoomControlsEnabled: false,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(left: 10.0, bottom: 80.0),
              height: 150.0,
              width: 70.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Card(
                      elevation: 8.0,
                      margin: EdgeInsets.all(8.0),
                      child: FlatButton(
                        color: Colors.white,
                        child: Icon(
                          Icons.traffic,
                          color: Colors.grey[700],
                        ),
                        onPressed: (){
                          setState(() {
                            _mapType = MapType.terrain;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 8.0,
                      margin: EdgeInsets.all(8.0),
                      child: FlatButton(
                        color: Colors.white,
                        child: Icon(
                          Icons.satellite,
                          color: Colors.grey[700],
                        ),
                        onPressed: (){
                          setState(() {
                            _mapType = MapType.satellite;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 8.0,
                      margin: EdgeInsets.all(8.0),
                      child: FlatButton(
                        color: Colors.white,
                        child: Icon(
                          Icons.map,
                          color: Colors.grey[700],
                        ),
                        onPressed: (){
                          setState(() {
                            _mapType = MapType.normal;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child:
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text('Confirm pickup', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: LocationBar(),
          )
        ],
      ),
      endDrawer: Drawer(),
    );
  }
}


class LocationBar extends StatefulWidget{


  @override
  State createState() {
    return LocationBarState();
  }
}

class LocationBarState extends State<LocationBar>{


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 10.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        height: 55.0,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.location_on,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child: Text('Abbasi Streat', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)),
                    Expanded(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'Abbasi Street- Khannal-Islamabad-Pakistanasfsaf', style: TextStyle(color: Colors.grey))
                            ]
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                  Icons.location_city
              ),
            )
          ],
        ),
      ),
    );
  }
}