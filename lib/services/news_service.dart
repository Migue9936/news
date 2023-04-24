

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:news/models/models.dart';
import 'package:http/http.dart' as http;

class NewsService extends ChangeNotifier{

  List<Article> headLines = [];

  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String,List<Article>?>? categoryArticles={};

  NewsService(){
    getTopHeadLines();
    // ignore: avoid_function_literals_in_foreach_calls
    categories.forEach((category) { 
      categoryArticles![category.name] = [];
    });
    
    getArticlesByCategory(_selectedCategory);
  }

  String get selectedCategory => _selectedCategory;
  
  set selectedCategory(String value){
    _selectedCategory = value;
    //Probar pasandole el valor del selectedCategory
    getArticlesByCategory(value);
    notifyListeners();
  }

  List<Article>? get getArticlesBySelectedCategory => categoryArticles![_selectedCategory];

 Future getTopHeadLines() async{

    var uri = Uri.https('newsapi.org', '/v2/top-headlines',{'country': 'us', 'apiKey': 'c7300eecbbdc4a85a0863ea51f6d9175'});
    
    final resp = await http.get(uri); 

    final newsResponse = newsResponseFromJson(resp.body);

    headLines.addAll(newsResponse.articles);
    notifyListeners();
    
  }

  Future getArticlesByCategory(String category) async{
    
    if (categoryArticles![category]!.isNotEmpty ) {
      return categoryArticles![category];
    }
    var uri = Uri.https('newsapi.org', '/v2/top-headlines',{'country': 'us','category':category, 'apiKey': 'c7300eecbbdc4a85a0863ea51f6d9175'});

    final resp = await http.get(uri); 

    final newsResponse = newsResponseFromJson(resp.body);
    
    categoryArticles![category]?.addAll(newsResponse.articles);

    notifyListeners();


  }

}