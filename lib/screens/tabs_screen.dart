import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:news/screens/screens.dart';
import 'package:news/providers/providers.dart';

class TabsScreen extends StatelessWidget {
   
  const TabsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
      body: _Pages(),
      bottomNavigationBar: _NavigationItems(),
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages();

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: navigationProvider.pageController,
      children: const [
        Tab1Screen(),
        Tab2Screen()
      ],
    );
  }
}

class _NavigationItems extends StatelessWidget {
  const _NavigationItems();
  @override
  Widget build(BuildContext context) {

    final navigationProvider = Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
      currentIndex: navigationProvider.actualPage,
      onTap: (value) => navigationProvider.actualPage = value,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person_outlined),label: 'For You'),
        BottomNavigationBarItem(icon: Icon(Icons.public_outlined),label: 'Headers'),
      ]
    );
  }
}