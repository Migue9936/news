

import 'package:flutter/material.dart';

import 'package:news/models/models.dart';
import 'package:http/http.dart' as http;

class NewsService extends ChangeNotifier{

  List<Article> headLines = [];



  NewsService(){
    getTopHeadLines();
  }


  getTopHeadLines()async{

    var uri = Uri.https('newsapi.org', '/v2/top-headlines',
        {'country': 'co', 'apiKey': 'c7300eecbbdc4a85a0863ea51f6d9175'});
    final resp = await http.get(uri); 


    final newsResponse = newsResponseFromJson(resp.body);

    headLines.addAll(newsResponse.articles);
    notifyListeners();
    

  }

}