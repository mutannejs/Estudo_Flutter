import 'package:flutter/material.dart';

class FlutterPage extends StatelessWidget {
  final void Function(int) changePage;

  const FlutterPage({super.key, required this.changePage});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network('https://miro.medium.com/v2/resize:fit:937/1*-pV23mdCNYrIuUTPFeuzxQ.png'),
          Container(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: const Text(
              'O que é Flutter?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
            child: const Text(
              '"O Flutter é uma estrutura de código aberto desenvolvida e sustentada pelo Google. Desenvolvedores de front-end e full-stack usam o Flutter para criar a interface de usuário (UI) de uma aplicação para várias plataformas com uma única base de código.\n\nQuando o Flutter foi lançado em 2018, ele oferecia suporte, principalmente, ao desenvolvimento de aplicações móveis. Atualmente, o Flutter oferece suporte ao desenvolvimento de aplicações em seis plataformas: iOS, Android, Web, Windows, MacOS e Linux."',
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
                        text: ': Amazon',
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
                icon: const Icon(Icons.navigate_next_rounded),
                label: const Text('Dart'),
                onPressed: () => changePage(2),
              ),
            ),
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}