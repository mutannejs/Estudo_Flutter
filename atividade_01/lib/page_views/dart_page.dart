import 'package:flutter/material.dart';

class DartPage extends StatelessWidget {
  final void Function(int) changePage;

  const DartPage({super.key, required this.changePage});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('lib/assets/dart.jpg'),
          Container(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: const Text(
              'O que é Dart?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
            child: const Text(
              '"Dart é uma linguagem de programação desenvolvida pela Google, semelhante a Java, C++, e JavaScript.\n\nEla é "levemente tipada" e pode ser tanto interpretada quanto compilada. Dart foi criada com o objetivo de ser uma linguagem multiplataforma, permitindo que você escreva o código uma vez e o execute em diversas plataformas.\n\nRecentemente, Dart tem sido amplamente utilizada no Flutter, como servidor web e, principalmente, para criar ferramentas para a própria linguagem, como o compilador e o analisador de código, todos escritos em Dart."',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 18),
            )
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Fonte',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                    children: [
                      TextSpan(
                        text: ': Alura',
                        style: TextStyle(fontWeight: FontWeight.normal)
                      )
                    ]
                  )
                )
              ]
            ),
          ),
          Center(
            child: Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.navigate_before_rounded),
                label: const Text('Home'),
                onPressed: () => changePage(0),
              ),
            ),
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}