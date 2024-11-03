import 'package:flutter/material.dart';

class FlutterPage extends StatelessWidget {
  final void Function(int) changePage;

  const FlutterPage({super.key, required this.changePage});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(),
    );
  }
}