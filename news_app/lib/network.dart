import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:news_app/article_model.dart';
import 'package:http/http.dart' as http;

List<Article> parseArticle(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<Article> articles =
      list.map((model) => Article.fromJson(model)).toList();
  return articles;
}

Future<List<Article>> fetchArticle() async {
  const url =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f8bb7a44a3a54ddc8a3025e0e72c6b67';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return compute(parseArticle, response.body);
  } else {
    throw Exception('Request API error');
  }
}
