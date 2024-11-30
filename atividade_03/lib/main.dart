import 'package:atividade_03/change_config.dart';
import 'package:atividade_03/result_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Config {
  Color color = Colors.deepPurple;
  double fontSize = 16;
  List<bool> fontStyle = [false, false, false];
  String fontFamily = 'Arial';
}

var configProvider = StateProvider( (ref) => Config() );

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ref.watch(configProvider).color),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var sizeCanva = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Appainter?'),
      ),
      body: SingleChildScrollView(
        child: sizeCanva.width < 900
          ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: ChangeConfig(rebuild)
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                // ignore: prefer_const_constructors
                child: ResultExample()
              )
            ]
          )
          : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                  child: ChangeConfig(rebuild)
                )
              ),
              // ignore: prefer_const_constructors
              Expanded(
                flex: 1,
                // ignore: prefer_const_constructors
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                  // ignore: prefer_const_constructors
                  child: ResultExample()
                )
              )
            ]
          )
      )
    );
  }
}
