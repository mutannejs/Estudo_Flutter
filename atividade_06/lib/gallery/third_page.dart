import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Image.asset(
        width: 400,
        'assets/img03.jpg',
      ),
    ),
  );
}