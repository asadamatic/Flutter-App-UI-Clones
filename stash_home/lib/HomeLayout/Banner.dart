import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget{

  MaterialColor color;
  bool margin = true, radius = true;
  String title, subTitle;
  IconData icon;
  CustomBanner({this.title, this.subTitle, this.icon, this.color, this.margin, this.radius});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: margin ? EdgeInsets.all(8.0): EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '$title ', style: TextStyle(color: Colors.amberAccent[100], letterSpacing: 1.1, fontWeight: FontWeight.bold, fontSize: 24.0)),
                  TextSpan(text: '$subTitle', style: TextStyle(letterSpacing: 1.1,fontWeight: FontWeight.bold, fontSize: 18.0)),
                ]
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
      decoration: radius ? BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: color,
      ) : BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
          color: color,
      ),
    );
  }
}