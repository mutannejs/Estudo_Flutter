import 'package:flutter/material.dart';

class GaleryPage extends StatefulWidget {
  const GaleryPage({super.key});

  @override
  State<GaleryPage> createState() => _GaleryPageState();
}

class _GaleryPageState extends State<GaleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Wrap(
          children: List.generate(3, (int i) {
            var id = i + 1;
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("/picture", arguments: id);
                },
                child: Hero(
                  tag: 'picture-0$id',
                  child: Image.asset(
                    width: 100,
                    'assets/img0$id.jpg',
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}