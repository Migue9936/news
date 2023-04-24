
import 'package:flutter/material.dart';
import 'package:news/models/models.dart';
import 'package:news/theme/theme.dart';

class ListNewsWidget extends StatelessWidget {

  final List<Article> news;

  const ListNewsWidget( this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          return _News(news: news[index], index: index);
        },
      ),
    );
  }
}


class _News extends StatelessWidget {

  final Article news;
  final int index;

  const _News({required this.news, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarCard(news,index),
        _TitleCard (news),
        _ImageCard(news: news),
        _BodyCard(news: news),
        const _ButtonsCard(),
        const SizedBox(height: 5),
        const Divider(
          thickness: 3,
        ),
      ],
    );
  }
}

class _TopBarCard extends StatelessWidget {

  final Article news;
  final int index;

  const _TopBarCard(this.news, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10,top: 20),
      child: Row(
        children: [
          Text('${index +1 }.  ',style: TextStyle(color: myTheme.colorScheme.secondary),),
          (news.author != null)
          ? SizedBox(
            width: 300,            
            child: Text('${news.author } - ${news.source.name }.  ',style: const TextStyle(fontWeight: FontWeight.bold))
            )
          : Text('No Author - ${news.source.name }.  ',style: const TextStyle(fontWeight: FontWeight.bold),)
        ]
      ),
    );
  }
}


class _TitleCard extends StatelessWidget {

  final Article news;

  const _TitleCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child:  Text(news.title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700 )),
    );
  }
}


class _ImageCard extends StatelessWidget {

  final Article news;
  const _ImageCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
        child: Container(
          child:  (news.urlToImage != null)
          ? FadeInImage(
            image: NetworkImage(news.urlToImage),
            placeholder: const AssetImage('assets/img/giphy.gif'),
           )
          :const Image(image: AssetImage('assets/img/no-image.png'))
          ),
      ),
    );
    
  }
}

class _BodyCard extends StatelessWidget {

  final Article news;

  const _BodyCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: (news.description != null)
      ? Text(news.description)
      : const Text('')
    );
  }
}

class _ButtonsCard extends StatelessWidget {
  const _ButtonsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20) ),
            fillColor: myTheme.colorScheme.secondary,
            child: const Icon(Icons.star_border_purple500),
            onPressed: () {
              
            },  
          ),
          const SizedBox(width: 10,),
          RawMaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20) ),
            fillColor: Colors.blue,
            child: const Icon(Icons.more),
            onPressed: () {
              
            },
          ),
        ],
      ),
    );
  }
}

