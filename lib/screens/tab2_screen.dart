import 'package:flutter/material.dart';

import 'package:news/models/models.dart';
import 'package:news/services/services.dart';
import 'package:news/theme/theme.dart';
import 'package:news/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body:  (newsService.getArticlesBySelectedCategory!.isNotEmpty)
          ? Column(
              children:  [
                const _CategoryList(),
                Expanded(child:ListNewsWidget(newsService.getArticlesBySelectedCategory!))
              ],
            )
          : Column(
              children:  const [
                _CategoryList(),
                SizedBox(height: 300),
                Center(child: CircularProgressIndicator())
              ],
            ),
      )
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList();

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal ,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _CategoryButtom(category: categories[index]),
                const SizedBox(height: 5),
                Text('${categories[index].name[0].toUpperCase()}${categories[index].name.substring(1)}')
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButtom extends StatelessWidget {
  

  final Category category;

  const _CategoryButtom({required this.category});

  @override
  Widget build(BuildContext context) {
    
    final newsService = Provider.of<NewsService>(context);
    
    return GestureDetector(
      onTap:() {
        // La función onTap asigna el nombre de la categoría tocada a la propiedad selectedCategory del servicio de noticias
        // Esto permitirá que otras partes de la aplicación sepan qué categoría está seleccionada actualmente
        final newsService = Provider.of<NewsService>(context,listen: false);
        newsService.selectedCategory = category.name;
      }, 
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.icon,
          // El color del icono depende de si la categoría actual es la seleccionada o no
          color: (newsService.selectedCategory == category.name) 
          ?myTheme.colorScheme.secondary
          :Colors.black54
        ),
      ),
    );

  }
}