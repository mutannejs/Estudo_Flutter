import 'package:atividade_02/main.dart';
import 'package:atividade_02/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostPage extends ConsumerStatefulWidget {
  const PostPage({super.key});

  @override
  ConsumerState<PostPage> createState() => _PostPageState();
}

class _PostPageState extends ConsumerState<PostPage> {
  @override
  Widget build(BuildContext context) {
    var post = ModalRoute.of(context)!.settings.arguments as Post;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              SelectableText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Título do post: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ref.watch(fontSizeProvider) * 14
                      ),
                    ),
                    TextSpan(
                      text: post.title,
                      style: TextStyle(
                        fontSize: ref.watch(fontSizeProvider) * 14
                      ),
                    ),
                  ]
                ),
              ),
              const SizedBox(height: 20),
              Image.network(
                'https://picsum.photos/id/${post.id}/300/300',
              ),
              const SizedBox(height: 20),
              SelectableText.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Conteúdo: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: post.body,
                    ),
                  ]
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: const Text('Voltar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}