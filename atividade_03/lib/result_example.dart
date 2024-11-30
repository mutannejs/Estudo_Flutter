import 'package:atividade_03/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultExample extends ConsumerStatefulWidget {
  const ResultExample({super.key});

  @override
  ConsumerState<ResultExample> createState() => _ResultExampleState();
}

class _ResultExampleState extends ConsumerState<ResultExample> {

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
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ref.watch(configProvider).color),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            style: textS(),
            decoration: InputDecoration(
              focusColor: ref.watch(configProvider).color,
              labelText: 'Text Field',
              filled: true,
            ),
          ),
          ElevatedButton.icon(
            onPressed: (){},
            icon: Icon(Icons.home_rounded, size: ref.watch(configProvider).fontSize),
            label: Text('Elevated Button', style: textS()),
          )
        ],
      ),
    );
  }
}