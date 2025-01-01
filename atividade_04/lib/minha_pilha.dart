import 'package:flutter/material.dart';

class MinhaPilha extends StatefulWidget {
  const MinhaPilha({super.key});

  @override
  State<MinhaPilha> createState() => _MinhaPilhaState();
}

class _MinhaPilhaState extends State<MinhaPilha> {
  OverlayEntry? entry;
  Offset offset = const Offset(380 / 2, 480 / 2);
  List<Color> colors = [Colors.red, Colors.blue, Colors.green, Colors.amber];
  List<int> orderColor = List.generate(4, (int i) => i);
  bool disableButton = false;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      entry = OverlayEntry(
        builder: (context) => Positioned(
          left: offset.dx,
          top: offset.dy,
          child: GestureDetector(
            onLongPressMoveUpdate: (details) {
              offset = details.globalPosition;
              entry!.markNeedsBuild();
            },
            child: ElevatedButton(
              onPressed: () {
                if (disableButton) return;

                disableButton = true;
                Navigator.of(context).pushNamed("/galery")
                  .then((answer) => disableButton = false);
              },
              child: const Text("Me arraste")
            )
          )
        )
      );

      final overlay = Overlay.of(context);
      overlay.insert(entry!);
    });

    return SizedBox(
      height: 500,
      width: 500,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text('Clique nos quadrados para trocar de cor'),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                setState(() {
                  orderColor[0] = (orderColor[0] + 1) % 4;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.linear,
                color: colors[ orderColor[0] ],
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: const Text('BR'),
              ),
            )
          ),
          Positioned(
            right: 0,
            top: 0,
            child: InkWell(
              onTap: () {
                setState(() {
                  orderColor[1] = (orderColor[1] + 1) % 4;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.bounceIn,
                color: colors[ orderColor[1] ],
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: const Text('TR'),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: InkWell(
              onTap: () {
                setState(() {
                  orderColor[2] = (orderColor[2] + 1) % 4;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                color: colors[ orderColor[2] ],
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: const Text('BL'),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: InkWell(
              onTap: () {
                setState(() {
                  orderColor[3] = (orderColor[3] + 1) % 4;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInCirc,
                color: colors[ orderColor[3] ],
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: const Text('TL'),
              ),
            ),
          ),
          TweenAnimationBuilder(
            curve: Curves.easeInBack,
            duration: const Duration(seconds: 3),
            tween: Tween<double>(begin: 0, end:380),
            builder: (_, double val, child) {
              return Positioned(
                bottom: 120,
                left: val,
                child: child!
              );
            },
            child: Container(
              color: Colors.blue[50],
              height: 50,
              alignment: Alignment.center,
              child: const Text('Eu me moverei!'),
            ),
          )
        ],
      ),
    );
  }

}