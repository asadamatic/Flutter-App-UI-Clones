import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OptionsScreen extends StatefulWidget{


  @override
  State createState() {
    return OptionsScreenState();
  }
}

class OptionsScreenState extends State<OptionsScreen>{

  List<List<String>> categories = [['Transport', 'transport.png'], ['Delivery', 'delivery.png'], ['Recharge', 'phone.png']];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Row(
            children: categories.map((category) => CategoryTile(title: category[0], imageUrl: category[1])).toList(),
          ),
        ),
        Container(
          child: RideTile()
        ),
        Container(
          child: PointsTile(),
        ),
        Container(
          child: PaymentTile(),
        ),

      ],
    );
  }
}

class PaymentTile extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 20.0),
      elevation: 8.0,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0)
        ),
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('USE YOUR POINTS', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1),),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.payment,
                      color: Colors.green,
                    ),
                    Text('PKR 6', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 1),),

                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 8.0, 15.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.greenAccent[100],
                    child: Icon(
                      Icons.screen_share,
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Send and receive credit among friends and family, hassle-free', style: TextStyle(fontSize: 16.0),),
                         ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(13.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.grey,
                  width: .5,
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: RichText(
                      text: TextSpan(
                        text: 'PKR   ',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 1),
                        children: <TextSpan>[
                          TextSpan(text: '0', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1),)
                        ]
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.grey,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PointsTile extends StatelessWidget{

  List<List<String>> pointsUsages = [['Starzplay 1 week Subscription', 'Use 1000 pts', 'image.jpg'], ['2 weeks Free on Tapmad Tv', 'Use 600 pts', 'image.jpg'], ['Plant a tree', 'Use 525 pts', 'image.jpg']];
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 15.0),
      elevation: 8.0,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0)
        ),
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('USE YOUR POINTS', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1),),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 8.0, 15.0),
              child: Row(

                children: <Widget>[
                  Icon(
                    Icons.account_box,
                    color: Colors.amber,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('You have 1,156 points', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                        Text('388 points expiring on 30 Jun 2020', style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 180.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: pointsUsages.map((usage) => PointsUsageTile(title: usage[0], points: usage[1], imageUrl: usage[2],)).toList(),

              ),
            )
          ],
        ),
      ),
    );
  }
}

class PointsUsageTile extends StatelessWidget{

  String title, points, imageUrl;

  PointsUsageTile({this.title, this.points, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      color: Colors.white,
      width: 150.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage('image.jpg'),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 0.0),
              child: Text(title, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Icon(
                  Icons.account_box,
                  color: Colors.amber,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,),
                  child: Text(points, style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class RideTile extends StatefulWidget{


  @override
  State createState() {
    return RideTileState();
  }
}

class RideTileState extends State<RideTile>{

  List<String> locaitons = ['Islamabad', 'Lahore', 'Karachi', 'Rawalpindi', 'Quetta', 'Peshawar', 'Gawadar'];

  InputDecoration locationDecoration = InputDecoration(
    hintText: 'Enter your destination',
    hintStyle: TextStyle(color: Colors.grey,),
    border: InputBorder.none,

  );
  TextEditingController locationController = TextEditingController();
  void setLocation(String location){
    setState(() {
      locationController.text = location;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 15.0),
      elevation: 8.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0)
        ),
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('BOOK A RIDE', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1),),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.location_city,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: locationController,
                        decoration: locationDecoration,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: locaitons.map((location) => LocationsTile(location: location, setLocation: setLocation)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LocationsTile extends StatelessWidget{

  String location;
  Function setLocation;
  LocationsTile({this.location, this.setLocation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      child: FlatButton(
        color: Colors.grey[300],
        child: Text(location),
        onPressed: () {
          setLocation(location);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget{

  String title, imageUrl;

  CategoryTile({this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/$title');
        },
        child: Card(
          margin: EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 15.0),
          elevation: 8.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0)
            ),
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage(imageUrl),
                  width: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}