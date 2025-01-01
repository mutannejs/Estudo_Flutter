import 'package:atividade_06/gallery/first_page.dart';
import 'package:atividade_06/gallery/second_page.dart';
import 'package:atividade_06/gallery/third_page.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Galeria'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Janelas', icon: Icon(Icons.window_outlined)),
              Tab(text: 'Balão', icon: Icon(Icons.air_outlined)),
              Tab(text: 'Estrleas', icon: Icon(Icons.star)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FirstPage(),
            SecondPage(),
            ThirdPage()
          ],
        ),
      ),
    );
}