import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Image.asset(
        width: 400,
        'assets/img02.jpg',
      ),
    ),
  );
}