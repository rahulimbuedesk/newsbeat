import 'dart:async';
import 'package:dio/dio.dart';
import 'package:newsbeat/model/article_response.dart';

import 'package:newsbeat/model/source_response.dart';

class NewsRepository {
  static String mainUrl = "https://newsapi.org/v2/";
  final String apiKey = "fba898fdbb81419dbc14605fbae37dca";
  
  final Dio _dio = Dio();

  var getSourcesUrl = '$mainUrl/sources';
  var getTopHeadlinesUrl = '$mainUrl/top-headlines';
  var everythingUrl = "$mainUrl/everything";
  
  Future<SourceResponse> getSources() async {
    var params = {
      "apiKey": apiKey,
      "language" : "en",
      "country" : "in"};
    try {
      Response response = await _dio.get(getSourcesUrl, queryParameters: params);
      return SourceResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SourceResponse.withError("$error");
    }
  }
  Future<ArticleResponse> getTopHeadlines() async {
    var params = {
      "apiKey": apiKey,
      "country" : "in"};
    try {
      Response response = await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleResponse.withError("$error");
    }
  }
  Future<ArticleResponse> search(String value) async {
    var params = {
      "apiKey": apiKey,
      "q" : value,
      "sortBy": "popularity"};
    try {
      Response response = await _dio.get(everythingUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleResponse.withError("$error");
    }
  }
  Future<ArticleResponse> getHotNews() async {
    var params = {
      "apiKey": apiKey,
      "q" : "apple",
      "sortBy": "popularity"};
    try {
      Response response = await _dio.get(everythingUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleResponse.withError("$error");
    }
  }
  Future<ArticleResponse> getSourceNews(String sourceId) async {
    var params = {
      "apiKey": apiKey,
      "sources" : sourceId};
    try {
      Response response = await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleResponse.withError("$error");
    }
  }
  
}