import 'package:flutter/material.dart';
import 'package:flutterappsanskar/View/article_view.dart';


Widget myAppBar(){
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,

      title: Text("News", style: TextStyle(color: Colors.white,)),
      backgroundColor: Colors.pinkAccent,
    ),
  );
}


class NewssTile extends StatelessWidget {
  final String url, name, desc, posturl;

  NewssTile({this.url, this.desc, this.name, @required this.posturl,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              postUrl: posturl,
            )
        ));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  SizedBox(height: 12,),
                  Text(
                    name,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),

                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  SizedBox(height: 12,),
                  Text(
                    url,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),

                ],
              ),
            ),
          )),
    );
  }
}