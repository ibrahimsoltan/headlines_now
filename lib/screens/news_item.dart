import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/news_response.dart';

class NewsItem extends StatelessWidget {
  Articles articles ;
  NewsItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CachedNetworkImage(
          imageUrl: articles.urlToImage?? "",
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
          errorWidget: (context, url, error) => Icon(Icons.error),
          height: 180, width: double.infinity , fit: BoxFit.fill,
        ),

        Text(articles.title??"" ,style: TextStyle(fontSize: 16 , color: Colors.black , fontWeight: FontWeight.bold),),
        Text(articles.author??"" ,style: TextStyle( fontSize: 12,color: Colors.grey),),
        Text(articles.publishedAt?.substring(0,10)??"",style: TextStyle( fontSize: 12,color: Colors.grey.shade400), textAlign: TextAlign.right),


      ],
    );
  }
}
