import 'package:atividade_02/change_interface.dart';
import 'package:atividade_02/widget_posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        elevation: 1,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ChangeInterface(),
            SizedBox(height: 20),
            Divider(),
            WidgetPosts(),
          ],
        ),
      ),
    );
  }
}