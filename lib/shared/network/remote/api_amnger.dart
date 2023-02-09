import 'dart:convert';

import 'package:headlines_now/models/SourcesResponse.dart';
import 'package:headlines_now/shared/components/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiManger {
  static Future<SourcesResponse> getSources() async {
    Uri URL =
        Uri.https(BaseUrl, '/v2/top-headlines/sources', {'apiKey': APIKey});
    Response sources = await http.get(URL);
    var json =jsonDecode(sources.body);
  SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
  return sourcesResponse;
  }
}
