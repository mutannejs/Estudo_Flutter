import 'package:flutter/material.dart';

class Picture extends StatefulWidget {
  const Picture({super.key});

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: 'picture-0$id',
            child: Image.asset(
              width: 800,
              'assets/img0$id.jpg',
            ),
          ),
        ),
      ),
    );
  }
}