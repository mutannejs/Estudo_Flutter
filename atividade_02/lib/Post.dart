import 'dart:convert';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
}

class Posts {
  final List<Post> posts;

  const Posts({required this.posts});

  factory Posts.fromJson(List<{Post}> json) {
    return Posts(posts: ([]));
    // return Posts(
    //   posts: (json.map((p) => Post(userId: p.userId, id: p.id, title: p.title, p.body)).toList()
    // );
  }
}