import 'dart:convert';

import 'package:atividade_02/posts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/** FETCH POST */
Future<Posts> fetchPosts() async {
  var resp = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  Posts posts = Posts.fromJson(jsonDecode(resp.body));
  return posts;
}

/** WIDGET POST */
class WidgetPost extends StatefulWidget {
  final Post post;

  const WidgetPost({
    super.key,
    required this.post
  });

  @override
  State<WidgetPost> createState() => _WidgetPostState();
}

class _WidgetPostState extends State<WidgetPost> {
  @override
  Widget build(BuildContext context) {
    var post = widget.post;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(post.title),
          subtitle: Text(
            post.body,
            overflow: TextOverflow.fade,
            maxLines: 2,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: const Text('Ver post completo'),
              onPressed: () {
                Navigator.of(context).pushNamed('/post', arguments: post);
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
        const Divider(
          endIndent: 20,
          indent: 20,
        )
      ]
    );
  }
}

/** WIDGET POSTS */
class WidgetPosts extends StatefulWidget {
  const WidgetPosts({super.key});

  @override
  State<WidgetPosts> createState() => _PostsState();
}

class _PostsState extends State<WidgetPosts> {

  Future<Posts>? posts;

  @override
  void initState() {
    super.initState();
    posts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: posts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children:
              snapshot
                .data!.posts.map(
                  (e) =>
                    WidgetPost(post: e)
                ).toList()
          );
        } else {
          return const Text('Erro ao carregar posts.');
        }
      },
    );
  }
}