import 'dart:convert';

import 'package:atividade_02/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Posts> fetchPosts() async {
  var posts = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var posts_c = Posts.fromJson(jsonDecode(posts.body));
  print(posts_c);
  return posts_c;
}

class WidgetPosts extends StatefulWidget {
  const WidgetPosts({super.key});

  @override
  State<WidgetPosts> createState() => _PostsState();
}

class _PostsState extends State<WidgetPosts> {

  var posts = fetchPosts();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}