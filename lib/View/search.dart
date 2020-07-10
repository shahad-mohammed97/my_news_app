import 'package:flutter/material.dart';
import 'package:flutterappsanskar/View/homepage.dart';
import 'package:flutterappsanskar/View/resources.dart';
import 'package:flutterappsanskar/View/top.dart';


class Searchpage extends StatefulWidget{
  static const routeName = '/search';
  @override
  _SearchpageState createState() => _SearchpageState();}


  class _SearchpageState extends State<Searchpage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,

          title: Text("News", style: TextStyle(color: Colors.pinkAccent,)),
          actions: <Widget>[
            IconButton(onPressed: (){},icon: Icon(Icons.search),)
          ],


          bottom: TabBar(tabs: <Widget>[
          Tab( icon: Icon(Icons.category), text: 'All News',),
          Tab(icon: Icon(Icons.star), text: 'Top Headlines',),
          Tab(icon: Icon(Icons.check_circle), text: 'Resources',),

        ],),
      ),
        body: TabBarView(
          children: <Widget>[
            HomePage(),TopPage(),SourcesPage()
          ],
        ),

    ),
    );

  }
  }



