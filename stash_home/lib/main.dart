import 'package:flutter/material.dart';
import 'package:stashhome/HomeLayout/Banner.dart';
import 'package:stashhome/HomeLayout/CategoryTiles.dart';
import 'package:stashhome/HomeLayout/CustomDrawer.dart';
import 'package:stashhome/Pages/ProductsScreen.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => MyHomePage(title:'Categories'),
        '/productsScreen': (context) => ProductsScreen(),
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


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              child: Icon(
                Icons.search
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: ListView(
        children: <Widget>[
          CustomBanner(title: 'Stash Kro', subTitle: 'Aish Kro..!', icon: Icons.directions_bike, color: Colors.green, margin: true, radius: true,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 12.0),
            child: Center(child: Text('Shop By categories', style: TextStyle(color: Colors.amber[700]),)),
          ),
          CategoryTiles(first: 'Breakfast & Cereals', firstTag: 'Breakfast & Cereals', firstImage: 'Assets/category1.jpg', second: 'Dairy', secondImage: 'Assets/category2.jpg', secondTag: 'Dairy', third: 'Fresh Meat & Frozen', thirdTag: 'Fresh Meat & Frozen', thirdImage: 'Assets/category3.jpg',),
          CategoryTiles(first: 'Oil & Ghee', firstTag: 'Oil & Ghee', firstImage: 'Assets/category1.jpg', second: 'Rice & Flour', secondTag: 'Rice & Flour', secondImage: 'Assets/category1.jpg', third: 'Fruits & Vegetables', thirdTag: 'Fruits & Vegetables', thirdImage: 'Assets/category1.jpg',),
          CustomBanner(title: 'Bringing Mart', subTitle: 'At Your Doorstep', icon: Icons.shopping_cart, color: Colors.blue, margin: false, radius: false,),
          CategoryTiles(first: 'Recipe Mix & Ingredients', firstTag: 'Recipe Mix & Ingredients', firstImage: 'Assets/category1.jpg', second: 'Baking, Pasta & Deserts', secondTag: 'Baking, Pasta & Deserts', secondImage: 'Assets/category1.jpg', third: 'Pulses & Spices', thirdTag: 'Pulses & Spices', thirdImage: 'Assets/category1.jpg',),
          CategoryTiles(first: 'Tea & Coffee', firstTag: 'Tea & Coffee', firstImage: 'Assets/category1.jpg', second: 'Beverages', secondTag: 'Beverages', secondImage: 'Assets/category1.jpg', third: 'Sweets & Snacks', thirdTag: 'Sweets & Snacks', thirdImage: 'Assets/category1.jpg',),
          CustomBanner(title: 'Offering', subTitle: '1000+ items', icon: Icons.card_giftcard, color: Colors.blue, margin: false, radius: false,),
          CategoryTiles(first: 'Personal Care', firstTag: 'Personal Care', firstImage: 'Assets/category1.jpg', second: 'Beauty Products', secondTag: 'Beauty Products', secondImage: 'Assets/category1.jpg', third: 'Baby Care', thirdTag: 'Baby Care', thirdImage: 'Assets/category1.jpg',),
          CategoryTiles(first: 'Home & Kitchen Care', firstTag: 'Home & Kitchen Care', firstImage: 'Assets/category1.jpg', second: 'Pet Care', secondTag: 'Pet Care', secondImage: 'Assets/category1.jpg', third: 'Ramadan Essentials', thirdTag: 'Ramadan Essentials', thirdImage: 'Assets/category1.jpg',),

        ],
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
