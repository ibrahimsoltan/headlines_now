import 'package:flutter/material.dart';
import 'package:headlines_now/models/news_response.dart';
import 'package:headlines_now/screens/news_item.dart';
import 'package:headlines_now/screens/tab_item.dart';
import 'package:headlines_now/shared/network/remote/api_amnger.dart';

import '../models/SourcesResponse.dart';

class MyTabController extends StatefulWidget {
  MyTabController(this.sources);
  List<Sources> sources;

  @override
  State<MyTabController> createState() => _MyTabControllerState();
}

class _MyTabControllerState extends State<MyTabController> {
  int selectedIndex= 0 ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (value) {
                selectedIndex = value;
                setState(() {

                });
              },
              isScrollable: true,
              labelColor: Colors.black,
              tabs: widget.sources.map((e) => TabItem(e, selectedIndex==widget.sources.indexOf(e)?true:false )).toList(),
            ),
            FutureBuilder<NewsResponse>(builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                     Text("Error ${snapshot.error}"),
                    TextButton(onPressed: () {}, child: const Text("Try Again"))
                  ],
                );
                snapshot.error;
              }
              if (snapshot.data?.status != 'ok') {
                return Column(
                  children: [
                    Text(snapshot.data!.message ?? ""),
                    TextButton(onPressed: () {}, child: const Text("Try Again"))
                  ],
                );
              }
              var articles = snapshot.data?.articles?? [];
              return Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return NewsItem(articles[index]);

                },itemCount: articles.length,),
              );

            },
            future: ApiManger.getNews(widget.sources[selectedIndex].id?? ""),
            )
          ],
        )
    );
  }
}
