import 'package:atividade_02/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> getSharedPreferences() => SharedPreferences.getInstance();

class MenuAnchorColors extends ConsumerStatefulWidget {
  const MenuAnchorColors({super.key});

  @override
  ConsumerState<MenuAnchorColors> createState() => _MenuAnchorColorsState();
}

class _MenuAnchorColorsState extends ConsumerState<MenuAnchorColors> {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      childFocusNode: _buttonFocusNode,
      menuChildren: [
        MenuItemButton(
          onPressed: () {
            ref.read(colorThemeProvider.notifier).state = Colors.deepPurple;
          },
          child: const Text('Roxo')
        ),
        MenuItemButton(
          onPressed: () {
            ref.read(colorThemeProvider.notifier).state = Colors.red;
          },
          child: const Text('Vermelho')
        ),
        MenuItemButton(
          onPressed: () {
            ref.read(colorThemeProvider.notifier).state = Colors.green;
          },
          child: const Text('Verde')
        ),
        MenuItemButton(
          onPressed: () {
            ref.read(colorThemeProvider.notifier).state = Colors.grey;
          },
          child: const Text('Azul')
        )
      ],
      builder: (_, MenuController controller, Widget? child) {
        return ElevatedButton(
          focusNode: _buttonFocusNode,
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: Text(
            'Alterar cor',
            style: TextStyle( fontSize: ref.watch(fontSizeProvider) ),
          ),
        );
      },
    );
  }
}

class MenuAnchorFonts extends ConsumerStatefulWidget {
  const MenuAnchorFonts({super.key});

  @override
  ConsumerState<MenuAnchorFonts> createState() => _MenuAnchorFontsState();
}

class _MenuAnchorFontsState extends ConsumerState<MenuAnchorFonts> {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      childFocusNode: _buttonFocusNode,
      menuChildren: [
        MenuItemButton(
          onPressed: () {
            ref.read(fontThemeProvider.notifier).state = 'Mono';
          },
          child: const Text('Mono', style: TextStyle(fontFamily: 'Mono'))
        ),
        MenuItemButton(
          onPressed: () {
            ref.read(fontThemeProvider.notifier).state = GoogleFonts.getFont('Roboto').fontFamily;
          },
          child: Text('Roboto', style: TextStyle(fontFamily: GoogleFonts.getFont('Roboto').fontFamily))
        ),
        MenuItemButton(
          onPressed: () {
            ref.read(fontThemeProvider.notifier).state = 'Times';
          },
          child: const Text('Times', style: TextStyle(fontFamily: 'Times'))
        ),
      ],
      builder: (_, MenuController controller, Widget? child) {
        return ElevatedButton(
          focusNode: _buttonFocusNode,
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: Text(
            'Alterar fonte',
            style: TextStyle( fontSize: ref.watch(fontSizeProvider) ),
          ),
        );
      },
    );
  }
}

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MenuAnchorColors(),
                SizedBox(width: 20),
                MenuAnchorFonts(),
                SizedBox(width: 20),
                IconButton.filledTonal(
                  onPressed: () {
                    var value = ref.read(fontSizeProvider.notifier).state++;
                    getSharedPreferences()
                      .then((onValue) {onValue.setDouble('fontSizeProvider', value);});
                  },
                  icon: Icon(Icons.add_rounded)
                ),
                SizedBox(width: 20),
                IconButton.filledTonal(
                  onPressed: () async {
                    var value = ref.read(fontSizeProvider.notifier).state--;
                    getSharedPreferences()
                      .then((onValue) {onValue.setDouble('fontSizeProvider', value);});
                  },
                  icon: Icon(Icons.remove_rounded)
                ),
                SizedBox(width: 20),
              ]
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}