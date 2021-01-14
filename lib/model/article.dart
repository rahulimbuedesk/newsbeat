import 'package:newsbeat/model/source.dart';

class ArticleModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String img;
  final String date;
  final String content;
  final SourceModel source;
  

  ArticleModel(this.source,this.author,this.title,this.description,this.url,this.img,this.date,this.content);

  ArticleModel.fromJson(Map<String, dynamic> json)
  : author = json["author"],
    title = json["title"],
    description = json["description"],
    url = json["url"],
    img = json["urlToImage"],
    date = json["publishedAt"],
    content = json["content"],
    source = SourceModel.fromJson(json["source"]);




}