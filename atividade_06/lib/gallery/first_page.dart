import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Image.asset(
        width: 400,
        'assets/img01.jpg',
      ),
    ),
  );
}
