import 'package:flutter/material.dart';

import 'package:flutterappsanskar/View/resources.dart';
import 'package:flutterappsanskar/View/homepage.dart';
import 'package:flutterappsanskar/View/search.dart';
import 'package:flutterappsanskar/View/top.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
        accentColor: Colors.pinkAccent,
          backgroundColor: Colors.white
      ),
      routes: {
      TopPage.routeName: (ctx) => TopPage(),

        HomePage.routeName: (ctx) => HomePage(),
      SourcesPage.routeName: (ctx) => SourcesPage(),
      Searchpage.routeName: (ctx) => Searchpage(),},
      home: HomePage(),
    );

}}