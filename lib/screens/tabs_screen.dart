import 'package:flutter/material.dart';

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

class _NavigationItems extends StatelessWidget {
  const _NavigationItems();
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person_outlined),label: 'For You'),
        BottomNavigationBarItem(icon: Icon(Icons.public_outlined),label: 'Headers'),
      ]
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages();

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}