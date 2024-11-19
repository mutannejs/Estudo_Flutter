import 'package:atividade_02/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

var colorThemeProvider;
var fontThemeProvider;
var fontSizeProvider;

void main() async {
  int? ctp;
  String? ftp;
  double? fsp;

  SharedPreferences
    .getInstance()
    .then((prefs) {
      // return prefs.clear();
      ctp = prefs.getInt('colorThemeProvider');
      ftp = prefs.getString('fontThemeProvider');
      fsp = prefs.getDouble('fontSizeProvider');
    });
  // return;

  colorThemeProvider = StateProvider((ref) => Color(ctp ?? Colors.deepPurple.value));
  fontThemeProvider = StateProvider((ref) => ftp ?? 'Arial');
  fontSizeProvider = StateProvider((ref) => fsp ?? 1.0);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ref.watch(colorThemeProvider)),
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: ref.watch(fontThemeProvider),
          fontSizeFactor: ref.watch(fontSizeProvider),
        )
      ),
      routes: {
        '/': (_) => const HomePage(),
      },
      initialRoute: '/',
    );
  }
}