import 'dart:math';

import 'package:flutter/material.dart';

class Mario extends StatelessWidget {
  final direction;
  final midrun;

  const Mario({Key? key, this.direction, this.midrun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return SizedBox(
        width: 64.0,
        height: 64.0,
        child: midrun
            ? Image.asset('assets/staddingMario.png')
            : Image.asset('assets/runningMario.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: SizedBox(
          width: 64.0,
          height: 64.0,
          child: midrun
              ? Image.asset('assets/staddingMario.png')
              : Image.asset('assets/runningMario.png'),
        ),
      );
    }
  }
}
