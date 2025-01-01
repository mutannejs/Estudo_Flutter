import 'package:atividade_06/post_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:loading_indicator/loading_indicator.dart';

class TextPage extends StatefulWidget {
  const TextPage({super.key});

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  Color _color = Colors.black;

  TextStyle getStyle(Color color, bool bold, double size) => TextStyle(
    fontFamily: 'Times',
    fontSize: size,
    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    color: color
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!.title, style: getStyle(_color, true, 35)),
                  Text(snapshot.data!.body, style: getStyle(_color, false, 20)),
                  Text('${snapshot.data!.id}'),
                ],
              );
            } else {
              return const Text('Error');
            }
          }
        ),
        // 'Hello Go Router!!!',
        // style: TextStyle(
        //   fontFamily: 'Times',
        //   fontSize: 45,
        //   fontWeight: FontWeight.bold,
        //   color: _color
        // ),
    ),
    floatingActionButtonLocation: ExpandableFab.location,
    floatingActionButton: ExpandableFab(
      children: [
        FloatingActionButton(
          onPressed: () => setState(() => _color = Colors.yellow[600]!),
          child: const Text("Y"),
        ),
        FloatingActionButton(
          onPressed: () => setState(() => _color = Colors.red[600]!),
          child: const Text("R"),
        ),
        FloatingActionButton(
          onPressed: () => setState(() => _color = Colors.green[600]!),
          child: const Text("G"),
        )
      ],
    ),
  );
}