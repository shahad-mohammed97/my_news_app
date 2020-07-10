import 'package:flutterappsanskar/Models/article.dart';
import 'package:http/http.dart' as http;
import 'package:flutterappsanskar/Helper/sourcewidget.dart';
import 'package:flutterappsanskar/Models/article.dart';

import 'dart:convert';


class SourcesNews {

  List<Article> sourcesnews  = [];

  Future<void> getSourcesNews() async{


    String url = "https://newsapi.org/v2/sources?apiKey=1abd39a53a8b4d07bac4ea22d397390b";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['url'] != null && element['description'] != null){
          Article article = Article(
            name: element['name'],

            description: element['description'],
            articleUrl: element["url"],
          );
          sourcesnews.add(article);
        }else if(jsonData['status'] == "error"){
          print('There is some thing wrong');

      }if(element['urlToImage'] == null && element['description'] == null){
          print(
            'This is the Source Page'
          );
        }
      });
    }
  }
}


class NewsForCategorie {

  List<Article> news  = [];

  Future<void> getNewsForCategory(String category) async{

    String url = "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=1abd39a53a8b4d07bac4ea22d397390b";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
