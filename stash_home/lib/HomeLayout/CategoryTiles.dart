import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryTiles extends StatelessWidget{

  String first, second, third, firstTag, secondTag, thirdTag, firstImage, secondImage, thirdImage;
  List<List<String>> categories;
  CategoryTiles({this.first, this.second, this.third, this.firstTag, this.secondTag, this.thirdTag, this.firstImage, this.secondImage, this.thirdImage});

  @override
  Widget build(BuildContext context) {
    categories = [[first, firstTag, firstImage], [second, secondTag, secondImage], [third, thirdTag, thirdImage]];

    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 0.0),
      child: SizedBox(
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: categories.map((category) => CategoryTile(categoryName: category[0], tag: category[1], imageUrl: category[2],)).toList(),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget{

  String categoryName, tag, imageUrl;
  CategoryTile({this.categoryName, this.tag, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Hero(
        tag: tag,
        child: GestureDetector(
          child: Container(
            margin: EdgeInsets.all(2.0),
            padding: EdgeInsets.all(20.0),
            alignment: Alignment(0.0, 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(.5), BlendMode.luminosity),
              ),
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: '$categoryName')
                  ]
              ),
            ),
          ),
          onTap: (){
            Navigator.pushNamed(context, '/productsScreen', arguments: {
              'categoryName': categoryName,
              'tag': tag,
              'imageUrl': imageUrl
            });
          },
        ),
      ),
    );
  }
}