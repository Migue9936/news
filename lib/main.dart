import 'package:flutter/material.dart';
import 'package:news/services/services.dart';


import 'package:provider/provider.dart';
import 'package:news/theme/theme.dart';
import 'package:news/screens/screens.dart';
import 'package:news/providers/providers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_) =>NavigationProvider()),
          ChangeNotifierProvider(create: (_) =>NewsService()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        initialRoute: 'tabs-page',
        routes: {
          'tabs-page': (_)=> const TabsScreen()
        }
        
      ),
    );
  }
}