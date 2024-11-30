import 'package:atividade_03/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeColor extends ConsumerStatefulWidget {
  const ChangeColor({super.key});

  @override
  ConsumerState<ChangeColor> createState() => _ChangeColorState();
}

class _ChangeColorState extends ConsumerState<ChangeColor> {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      dropdownMenuEntries: const [
        DropdownMenuEntry(value: Colors.deepPurple, label: 'Roxo'),
        DropdownMenuEntry(value: Colors.red, label: 'Vermelho'),
        DropdownMenuEntry(value: Colors.green, label: 'Verde'),
        DropdownMenuEntry(value: Colors.yellow, label: 'Amarelo'),
      ],
      initialSelection: ref.watch(configProvider).color,
      onSelected: (i) {
        if (i == null) return;
        ref.read(configProvider.notifier).state.color = i;
      }
    );
  }
}

class ChangeFontSize extends ConsumerStatefulWidget {
  const ChangeFontSize({super.key});

  @override
  ConsumerState<ChangeFontSize> createState() => _ChangeFontSizeState();
}

class _ChangeFontSizeState extends ConsumerState<ChangeFontSize> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: ref.watch(configProvider).fontSize,
      min: 12,
      max: 56,
      onChanged: (value) {
        setState(() {
          ref.read(configProvider.notifier).state.fontSize = value;
        });
      }
    );
  }
}


class CheckboxField extends ConsumerStatefulWidget {
  final int index;
  final Text label;

  const CheckboxField({
    super.key,
    required this.index,
    required this.label
  });

  @override
  ConsumerState<CheckboxField> createState() => _CheckboxFieldState();
}

class _CheckboxFieldState extends ConsumerState<CheckboxField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: ref.read(configProvider).fontStyle[widget.index],
          onChanged: (value) {
            setState(() {
              ref.read(configProvider.notifier).state.fontStyle[widget.index] = value!;
            });
          }
        ),
        InkWell(
          onTap: () {
            setState(() {
              ref.read(configProvider.notifier).state.fontStyle[widget.index] = !ref.read(configProvider).fontStyle[widget.index];
            });
          },
          child: widget.label
        )
      ],
    );
  }
}


class ChangeFontStyle extends ConsumerStatefulWidget {
  const ChangeFontStyle({super.key});

  @override
  ConsumerState<ChangeFontStyle> createState() => _ChangeFontStyleState();
}

class _ChangeFontStyleState extends ConsumerState<ChangeFontStyle> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CheckboxField(
          index: 0,
          label: Text('Bold', style: TextStyle(fontWeight: FontWeight.bold))
        ),
        CheckboxField(
          index: 1,
          label: Text('Italic', style: TextStyle(fontStyle: FontStyle.italic))
        ),
        CheckboxField(
          index: 2,
          label: Text('underline', style: TextStyle(decoration: TextDecoration.underline))
        ),
      ],
    );
  }
}


class ChangeFontFamily extends ConsumerStatefulWidget {
  const ChangeFontFamily({super.key});

  @override
  ConsumerState<ChangeFontFamily> createState() => _ChangeFontFamilyState();
}

class _ChangeFontFamilyState extends ConsumerState<ChangeFontFamily> {
  var _chipSelected = false;

  void toggleSelected() {
    setState(() {
      _chipSelected = !_chipSelected;
      if (_chipSelected){
        ref.read(configProvider.notifier).state.fontFamily = 'Mono';
      } else {
        ref.read(configProvider.notifier).state.fontFamily = 'Ubuntu';
      }}
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InputChip(
          selected: _chipSelected,
          onPressed: toggleSelected,
          label: const Text('Mono', style: TextStyle(fontFamily: 'Mono'))
        )
      ],
    );
  }
}

class ChangeConfig extends StatefulWidget {
  final void Function() rebuild;

  const ChangeConfig(this.rebuild, {super.key});

  @override
  State<ChangeConfig> createState() => _ChangeConfigState();
}

class _ChangeConfigState extends State<ChangeConfig> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ChangeColor(),
          const ChangeFontSize(),
          const ChangeFontStyle(),
          const ChangeFontFamily(),
          ElevatedButton(
            onPressed: () => widget.rebuild(),
            child: const Text('Aplicar')
          ),
        ]
      ),
    );
  }
}