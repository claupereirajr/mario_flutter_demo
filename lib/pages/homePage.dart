import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mario_flutter/widgets/jumpingMario.dart';
import 'package:mario_flutter/widgets/marioCharcter.dart';

import '../widgets/defaultButton.dart';

class HomePage extends StatefulWidget {
  final bool enabled;

  const HomePage({
    Key? key,
    required this.enabled,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double marioX = -1;
  static double marioY = 1;

  double height = 0;
  double time = 0;
  double initialHeight = marioY;

  String direction = "right";

  bool midrun = false;
  bool midjump = false;

  void preJump() {
    time = 0;
    initialHeight = marioY;
  }

  void jump() {
    if (midjump == false) {
      preJump();
      midjump = true;
      Timer.periodic(const Duration(milliseconds: 50), (timer) {
        time += 0.05;
        height = -4.9 * time * time + 5 * time;

        if (initialHeight - height > 1) {
          setState(() {
            marioY = 1;
          });
          midjump = false;
          timer.cancel();
        } else {
          setState(() {
            marioY = initialHeight - height;
          });
        }
      });
    }
  }

  void moveLeft() {
    direction = "left";

    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (DefaultButton.holdingButton == true) {
        setState(() {
          marioX -= 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void moveRight() {
    direction = "right";

    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (DefaultButton.holdingButton == true) {
        setState(() {
          marioX += 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = widget.enabled ? () {} : null;
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.blue,
              child: AnimatedContainer(
                alignment: Alignment(marioX, marioY),
                duration: const Duration(milliseconds: 0),
                child: midjump
                    ? JumpingMario(
                        direction: direction,
                      )
                    : Mario(
                        direction: direction,
                        midrun: midrun,
                      ),
              ),
            ),
          ),
          Container(
            height: 10,
            color: Colors.green,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DefaultButton(
                    function: moveLeft,
                    icon: const Icon(
                        color: Colors.white, size: 36.0, Icons.arrow_back),
                  ),
                  DefaultButton(
                    function: jump,
                    icon: const Icon(
                        color: Colors.white, size: 36.0, Icons.arrow_upward),
                  ),
                  DefaultButton(
                    function: moveRight,
                    icon: const Icon(
                        color: Colors.white, size: 36.0, Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
