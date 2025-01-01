import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
    this.userId,
    this.id,
    this.title,
    this.body
  );

  factory Post.fromJson(Map json) {
    return Post(
      json['userId'],
      json['id'],
      json['title'],
      json['body'],
    );
  }
}

Future<Post?> fetchPost() async {
  var client = http.Client();
  var randomNumber = Random().nextInt(100);
  Post? post;
  try {
    var resp = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$randomNumber')
    );
    var decodedResp = jsonDecode(resp.body) as Map;
    post = Post.fromJson(decodedResp);
  } finally {
    client.close();
  }
  return post;
}