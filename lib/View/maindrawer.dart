

import 'package:flutter/material.dart';
import 'package:flutterappsanskar/View/resources.dart';
import 'package:flutterappsanskar/View/homepage.dart';
import 'package:flutterappsanskar/View/search.dart';

import 'package:flutterappsanskar/View/top.dart';

class MainDrawer extends StatelessWidget{
  Widget buildListTile(String title, IconData icon, Function taphandler){
    return ListTile(
      leading: Icon(icon,size: 20,),

      title: Text(title,
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black
    ),
    ),
      onTap: taphandler,
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(

        child: Column(
          children: <Widget>[
          Container(color: Colors.pinkAccent,
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
            child: Text('Main Menu',style: TextStyle(
            color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 20,),

        buildListTile('Top Headlines', Icons.star, (){
          Navigator.of(context).pushNamed(TopPage.routeName);
        }
        ,),
            buildListTile('All News', Icons.category,(){
              Navigator.of(context).pushNamed(HomePage.routeName);
            }),
            buildListTile('Resources', Icons.check_circle,(){
              Navigator.of(context).pushNamed(SourcesPage.routeName);
            }),
            buildListTile('Search', Icons.search,(){
              Navigator.of(context).pushNamed(Searchpage.routeName);
            }
            ),
    ],
        ),
    );
  }
}