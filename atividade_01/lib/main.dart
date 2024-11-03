import 'package:atividade_01/page_views/dart_page.dart';
import 'package:atividade_01/page_views/flutter_page.dart';
import 'package:atividade_01/page_views/home_page.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var colorSeed = const Color.fromRGBO(26, 35, 126, 1);

  void changeColor(Color color) {
    setState(() {
      colorSeed = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colorSeed)
      ),
      home: BaseMyApp(changeColor: changeColor)
    );
  }
}

class BaseMyApp extends StatefulWidget {
  final ValueChanged<Color> changeColor;

  const BaseMyApp({super.key, required this.changeColor});

  @override
  State<BaseMyApp> createState() => _BaseMyAppState();
}

class _BaseMyAppState extends State<BaseMyApp> {
  final _pageController = PageController();
  var _indexPage = 0;

  @override
  Widget build(BuildContext context) {

    genListTile(String title, int index) {
      return ListTile(
        title: Text(title),
        onTap: () {
          _pageController.jumpToPage(index);
          setState((){_indexPage = index;});
          Navigator.pop(context);
        },
      );
    }

    changePage(int indexPage) {
      _pageController.animateToPage(
        indexPage,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn
      );
      setState(() {
        _indexPage = indexPage;
      });
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(
            'Sobre Flutter',
            style: TextStyle(
              fontFamily: 'Times',
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Theme.of(context).primaryColor
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            addRepaintBoundaries: true,
            children: [
              genListTile('Home', 0),
              genListTile('Flutter', 1),
              genListTile('Dart', 2),
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          children: [
            HomePage(changeColor: widget.changeColor, changePage: changePage),
            FlutterPage(changePage: changePage),
            DartPage(changePage: changePage)
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indexPage,
          onTap: changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.color_lens_rounded),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: FlutterLogo(),
              label: 'Flutter'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.language_rounded),
              label: 'Dart'
            ),
          ]
        ),
      );
  }
}