import 'dart:convert';

import 'package:headlines_now/models/SourcesResponse.dart';
import 'package:headlines_now/models/news_response.dart';
import 'package:headlines_now/shared/components/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiManger {
  static Future<SourcesResponse> getSources() async {
    Uri URL =
        Uri.https(BaseUrl, '/v2/top-headlines/sources', {'apiKey': APIKey});
    Response sources = await http.get(URL);
    try {
      var json = jsonDecode(sources.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      print("error here  $e");
      throw e;
    }
  }


  static Future<NewsResponse> getNews(String sourceId) async {
    Uri URL =
        Uri.https(BaseUrl,'/v2/everything',{
          'apiKey' : APIKey,
          'sources' : sourceId
        });
    Response articles = await http.get(URL);

    try {
      var json = jsonDecode(articles.body);
      NewsResponse newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    }
    catch(e){
      print('error here $e');
      throw e;
    }




  }
}
