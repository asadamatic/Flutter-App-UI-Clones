import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget{

  TabController controller;
  Key key;
  Categories({this.key, this.controller});
  @override
  State createState() {
    return CategoriesState();
  }
}

class CategoriesState extends State<Categories>{

  List<CategoryData> categories = [CategoryData(title: 'Graphics & Design', subTitle: 'Logo & Brand Indentity, Art & Iluustration', icon: Icons.format_paint),
    CategoryData(title: 'Digital Marketing', subTitle: 'Articles & Blog Posts, Translation', icon: Icons.live_tv),
    CategoryData(title: 'Writing & Translation', subTitle: 'Whiteboard & Animated Explainers, Video Editing', icon: Icons.translate),
    CategoryData(title: 'Video & Animation', subTitle: 'Logo & Brand Indentity, Art & Iluustration', icon: Icons.music_video),
    CategoryData(title: 'Music & Audio', subTitle: 'Logo & Brand Indentity, Art & Iluustration', icon: Icons.music_note),
    CategoryData(title: 'Programming & tech', subTitle: 'Logo & Brand Indentity, Art & Iluustration', icon: Icons.open_in_browser),
    CategoryData(title: 'Business', subTitle: 'Logo & Brand Indentity, Art & Iluustration', icon: Icons.business),
    CategoryData(title: 'Lifestyle', subTitle: 'Logo & Brand Indentity, Art & Iluustration', icon: Icons.style)
  ];

  List<CategoryData> filteredList= List();

  void filterList(String value){
    setState(() {
      if (value.isEmpty){
        filteredList = categories;
      }{

        List<CategoryData> temporaryList = List();

        for (int index = 0; index < filteredList.length; index++){

          if (filteredList[index].title.toLowerCase().contains(value.toLowerCase()) || filteredList[index].subTitle.toLowerCase().contains(value.toLowerCase())){

            temporaryList.add(filteredList[index]);
          }
        }

        filteredList = temporaryList;

      }
    });
  }

  void closeSearch(){
    setState(() {
      filteredList = categories;
    });
  }
  @override
  void initState() {
    super.initState();
    filteredList = categories;
  }
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.controller,
      children: <Widget>[
        ListView(
          children: <Widget>[
            Column(
              children:
                filteredList.map((category) => CategoriesTile(categoryData: category,)).toList(),
            ),
          ],
        ),
        Column(

        )
      ],
    );
  }
}

class CategoriesTile extends StatelessWidget{

  CategoryData categoryData;

  CategoriesTile({this.categoryData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              categoryData.icon,
              size: 45.0,
              color: Colors.greenAccent,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(categoryData.title, style: TextStyle(fontSize: 20.0,color: Colors.black, fontWeight: FontWeight.bold),),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: RichText(

                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: '${categoryData.subTitle}', style: TextStyle(color: Colors.black,),),
                          ]
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryData{

  String title, subTitle;
  IconData icon;
  CategoryData({this.title, this.subTitle, this.icon});
}