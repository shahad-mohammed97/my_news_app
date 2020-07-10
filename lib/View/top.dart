import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterappsanskar/Helper/data.dart';

import 'package:flutterappsanskar/Helper/topdata.dart';
import 'package:flutterappsanskar/Helper/widgets.dart';
import 'package:flutterappsanskar/Models/categorie_model.dart';
import 'package:flutterappsanskar/View/categorie_view.dart';
import 'package:flutterappsanskar/View/maindrawer.dart';





class TopPage extends StatefulWidget {
  static const routeName = '/tops';
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {

  bool _loading;
  var topnewslist;

  List<CategorieModel> categories = List<CategorieModel>();

  void getTopNews() async {
    TopNews topnews = TopNews();
    await topnews.getTopNews();
    topnewslist = topnews.topnews;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();

    categories = getCategories();
    getTopNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( centerTitle: true,

        title: Text("News", style: TextStyle(color: Colors.white,)),




      ),drawer: MainDrawer(

    ),
      body: SafeArea(
        child: _loading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[Container(
              height: 10,),
                /// Categories
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 70,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          imageAssetUrl: categories[index].imageAssetUrl,
                          categoryName: categories[index].categorieName,
                        );
                      }),
                ),

                /// News Article
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: ListView.builder(
                      itemCount: topnewslist.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NewsTile(
                          imgUrl: topnewslist[index].urlToImage ?? "",
                          title: topnewslist[index].title ?? "",
                          desc: topnewslist[index].description ?? "",
                          content: topnewslist[index].content ?? "",
                          posturl: topnewslist[index].articleUrl ?? "",
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName;

  CategoryCard({this.imageAssetUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>
                CategoryNews(
                  newsCategory: categoryName.toLowerCase(),
                )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: imageAssetUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26
              ),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}