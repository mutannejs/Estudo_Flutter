import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class HomePage extends StatelessWidget {
  final ValueChanged<Color> changeColor;

  const HomePage({super.key, required this.changeColor});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor
            ),
            child: const Center(
              child: Text(
                'Seja bem vindo',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: const Center(
              child: Text(
                'Antes de conhecer um pouco mais sobre Flutter e Dart, gostaria de alterar a cor primária da aplicação?',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Center(
            child: ColorPicker(
              pickerColor: Theme.of(context).primaryColor,
              onColorChanged: changeColor,
              pickerAreaBorderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                child: const Center(
                  child: Text(
                    'Escolhido a nova cor, vá para a próxima página e conheça um pouco mais sobre o Flutter clicando no botão a baixo:',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.navigate_next_rounded),
                  label: const Text('Flutter'),
                  onPressed: () {},
                ),
              ),
            ]
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}