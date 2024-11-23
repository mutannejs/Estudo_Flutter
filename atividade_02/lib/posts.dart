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

  factory Post.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
        'body': String body
      } =>
        Post(
          userId: userId,
          id: id,
          title: title,
          body: body
        ),
      _ => throw const FormatException('Failed to load post.'),
    };
  }
}

class Posts {
  final List<Post> posts;

  const Posts({required this.posts});

  factory Posts.fromJson(List<dynamic> json) {
    // return switch (json) {
    //   List<dynamic> posts => Posts(
    //     posts: posts.map<Post>(
    //       (p) => Post.fromJson( p ) ).toList()
    //     ),
    //   _ => throw const FormatException('Failed to load posts'),
    // };
    if (json.runtimeType == List<dynamic>) {
      return Posts(
        posts: json.map<Post>(
          (p) => Post.fromJson( p ) ).toList()
      );
    } else {
      throw const FormatException('Failed to load posts');
    }
  }
}