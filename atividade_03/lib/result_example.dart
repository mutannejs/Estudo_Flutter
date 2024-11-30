import 'dart:convert';
import 'dart:math';

import 'package:atividade_03/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
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

class ResultExample extends ConsumerStatefulWidget {
  const ResultExample({super.key});

  @override
  ConsumerState<ResultExample> createState() => _ResultExampleState();
}

class _ResultExampleState extends ConsumerState<ResultExample> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  TextStyle textS() {
    return TextStyle(
      fontSize: ref.watch(configProvider).fontSize,
      fontWeight: ref.watch(configProvider).fontStyle[0] ? FontWeight.bold : FontWeight.normal,
      fontStyle: ref.watch(configProvider).fontStyle[1] ? FontStyle.italic : FontStyle.normal,
      decoration: ref.watch(configProvider).fontStyle[2] ? TextDecoration.underline : TextDecoration.none
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
      // ignore: prefer_const_constructors
      child: Theme(
        data: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ref.watch(configProvider).color),
          fontFamily: ref.watch(configProvider).fontFamily
        ),
        child: FutureBuilder(
          future: fetchPost(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const IntrinsicHeight(
                child: IntrinsicWidth(
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballRotate,
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              _titleController.text = snapshot.data!.title;
              _bodyController.text = snapshot.data!.body;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                const Text(
                  'Exemplo para o estilo definido:',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text('Título: ')
                    ),
                    Expanded(
                      child: TextField(
                        controller: _titleController,
                        readOnly: true,
                        style: textS(),
                        decoration: InputDecoration(
                          focusColor: ref.watch(configProvider).color,
                          labelText: 'Filled TextField',
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text('Corpo: ')
                    ),
                    Expanded(
                      child: TextField(
                        controller: _bodyController,
                        readOnly: true,
                        style: textS(),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusColor: ref.watch(configProvider).color,
                          labelText: 'Outline Input Border',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    ElevatedButton.icon(
                      onPressed: (){},
                      icon: Icon(Icons.home_rounded, size: ref.watch(configProvider).fontSize),
                      label: Text('Elevated Button', style: textS()),
                    ),
                    OutlinedButton.icon(
                      onPressed: (){},
                      icon: Icon(Icons.home_outlined, size: ref.watch(configProvider).fontSize),
                      label: Text('Outlined Button', style: textS()),
                    ),
                    FilledButton.icon(
                      onPressed: (){},
                      icon: Icon(Icons.home_filled, size: ref.watch(configProvider).fontSize),
                      label: Text('Filled Button', style: textS()),
                    )
                  ],
                )
              ]
                );
            } else {
              return const Text('Erro ao carregar posts.');
            }
          }
        )
      )
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}