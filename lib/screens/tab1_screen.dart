import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news/services/services.dart';

class Tab1Screen extends StatelessWidget {
   
  const Tab1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return const Scaffold(
      body: Center(
         child: Text('Tab1Screen'),
      ),
    );
  }
}