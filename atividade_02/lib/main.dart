import 'package:atividade_02/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

Future<SharedPreferences> getSharedPreferences() => SharedPreferences.getInstance();

var colorThemeProvider = StateProvider((ref) => Colors.deepPurple);
var fontThemeProvider = StateProvider((ref) => GoogleFonts.getFont('Lato').fontFamily);
var fontSizeProvider = StateProvider((ref) => 15.0);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    SharedPreferences
      .getInstance()
      .then((prefs) {
        ref.read(fontSizeProvider.notifier).state = prefs.getDouble('fontSizeProvider') ?? 15.0;
        ref.read(fontThemeProvider.notifier).state = prefs.getString('fontThemeProvider') ?? ref.watch(fontThemeProvider);
      });

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ref.watch(colorThemeProvider)),
        fontFamily: ref.watch(fontThemeProvider),
      ),
      routes: {
        '/': (_) => const HomePage(),
      },
      initialRoute: '/',
    );
  }
}