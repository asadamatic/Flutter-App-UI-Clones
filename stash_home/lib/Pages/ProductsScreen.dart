import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stashhome/Product.dart';

class ProductsScreen extends StatefulWidget{


  @override
  State createState() {
    return _ProductsScreenState();
  }
}

class _ProductsScreenState extends State<ProductsScreen>{

  Map data;

  List<Product> products = [Product(name: 'Biscuit', price: 100.0, imageUrl: 'Assets/biscuit.png'),
    Product(name: 'Cake', price: 200.0, imageUrl: 'Assets/cake.png'),
    Product(name: 'Milk', price: 50.0, imageUrl: 'Assets/milk.png'),
    Product(name: 'Bread', price: 70.0, imageUrl: 'bread.png'),
    Product(name: 'Cereal', price: 70.0, imageUrl: 'cereal.png'),
    Product(name: 'Eggs', price: 70.0, imageUrl: 'eggs.png'),
    Product(name: 'Rice', price: 70.0, imageUrl: 'rice.png'),
    Product(name: 'Flour', price: 70.0, imageUrl: 'flour.png')];
  static String pageTitle = 'Products';
  IconData searchIcon = Icons.search;
  Widget appBarTitle = Text('$pageTitle');
  List<Product> filteredProducts = List();
  InputDecoration searchDecoration = InputDecoration(hintText: 'Search here...', hintStyle: TextStyle(color: Colors.white), enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)), focusedBorder: InputBorder.none);

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }
  void searchProducts(String value){
    setState(() {

      if (value.isEmpty){
        filteredProducts = products;
      }else{

        List<Product> temporaryProducts = List();
        for (int index = 0; index < filteredProducts.length; index++){
          if (filteredProducts[index].name.toLowerCase().contains(value.toLowerCase())){
            temporaryProducts.add(filteredProducts[index]);
          }
        }
        filteredProducts = temporaryProducts;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    pageTitle = data['categoryName'];
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              searchIcon,
            ),
            onPressed: () {

              setState(() {

                searchIcon = searchIcon == Icons.search ? Icons.close : Icons.search;
                appBarTitle = searchIcon == Icons.search ? Text('Products') : TextField(decoration: searchDecoration, style: TextStyle(color: Colors.white), onChanged: (value){ searchProducts(value);},);
                filteredProducts = products;
              });
            },
          )
        ],
      ),
      body: ListView(

        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: data['tag'],
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    padding: EdgeInsets.all(60.0),
                    alignment: Alignment(0.0, 0.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(data['imageUrl']),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.luminosity),
                      ),
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: "${data['categoryName']}", style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, letterSpacing: 1))
                          ]
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          GridView.count(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: filteredProducts.map((filteredProduct) => ProductTile(product: filteredProduct,)).toList(),
          ),
        ],
      ),
    );
  }
}

class ProductTile extends StatelessWidget{

  Product product;
  ProductTile({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Image(
              image: AssetImage(product.imageUrl),
              fit: BoxFit.contain,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text('${product.name}', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text('${product.price}', style: TextStyle(fontSize: 16.0,),),
              ),
            ],
          ),

        ],
      ),
    );
  }
}