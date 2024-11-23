import 'package:atividade_02/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
            getSharedPreferences().then((prefs) {prefs.setInt('colorThemeProvider', Colors.deepPurple.value);});
          },
          child: const Text('Roxo')
        ),
        MenuItemButton(
          onPressed: () {
            ref.read(colorThemeProvider.notifier).state = Colors.red;
            getSharedPreferences().then((prefs) {prefs.setInt('colorThemeProvider', Colors.red.value);});
          },
          child: const Text('Vermelho')
        ),
        MenuItemButton(
          onPressed: () {
            ref.read(colorThemeProvider.notifier).state = Colors.green;
            getSharedPreferences().then((prefs) {prefs.setInt('colorThemeProvider', Colors.green.value);});
          },
          child: const Text('Verde')
        ),
        MenuItemButton(
          onPressed: () {
            ref.read(colorThemeProvider.notifier).state = Colors.grey;
            getSharedPreferences().then((prefs) {prefs.setInt('colorThemeProvider', Colors.grey.value);});
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
          child: const Text('Alterar cor'),
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
            getSharedPreferences().then((prefs) {prefs.setString('fontThemeProvider', 'Mono');});
          },
          child: const Text('Mono', style: TextStyle(fontFamily: 'Mono'))
        ),
        MenuItemButton(
          onPressed: () {
            ref.read(fontThemeProvider.notifier).state = 'Arial';
            getSharedPreferences().then((prefs) {prefs.setString('fontThemeProvider', 'Arial');});
          },
          child: const Text('Arial', style: TextStyle(fontFamily: 'Arial'))
        ),
        MenuItemButton(
          onPressed: () {
            ref.read(fontThemeProvider.notifier).state = 'Times';
            getSharedPreferences().then((prefs) {prefs.setString('fontThemeProvider', 'Times');});
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
          child: const Text('Alterar fonte'),
        );
      },
    );
  }
}

class ChangeInterface extends ConsumerStatefulWidget {
  const ChangeInterface({super.key});

  @override
  ConsumerState<ChangeInterface> createState() => _ChangeInterfaceState();
}

class _ChangeInterfaceState extends ConsumerState<ChangeInterface> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const MenuAnchorColors(),
        const SizedBox(width: 20),
        const MenuAnchorFonts(),
        const SizedBox(width: 20),
        IconButton.filledTonal(
            onPressed: () {
              var value = ref.read(fontSizeProvider.notifier).state += .1;
              getSharedPreferences().then((onValue) {
                onValue.setDouble('fontSizeProvider', value);
              });
            },
            icon: const Icon(Icons.add_rounded)),
        const SizedBox(width: 20),
        IconButton.filledTonal(
            onPressed: () async {
              var value = ref.read(fontSizeProvider.notifier).state -= .1;
              getSharedPreferences().then((prefs) {
                prefs.setDouble('fontSizeProvider', value);
              });
            },
            icon: const Icon(Icons.remove_rounded)),
        const SizedBox(width: 20),
      ]
    );
  }
}
