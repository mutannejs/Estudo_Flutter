import 'package:atividade_03/change_config.dart';
import 'package:atividade_03/result_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Config {
  Color color;
  double fontSize;
  List<bool> fontStyle = [false, false, false];

  Config({
    required this.color,
    required this.fontSize
  });
}

var configProvider = StateProvider(
  (ref) => Config(
    color: Colors.deepPurple,
    fontSize: 16.0
  )
);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Appainter'),
      ),
      body: Column(
        children: [
          ChangeColor(),
          ChangeFontSize(),
          ChangeFontStyle(),
          ElevatedButton(onPressed: ()=> setState((){}), child: Text('Aplicar')),
          Divider(height: 20,),
          ResultExample()
        ]
      ),
    );
  }
}
