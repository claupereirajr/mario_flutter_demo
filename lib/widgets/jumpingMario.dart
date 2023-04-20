import 'dart:math';

import 'package:flutter/material.dart';

class JumpingMario extends StatelessWidget {
  final direction;

  const JumpingMario({Key? key, this.direction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return SizedBox(
          width: 64.0,
          height: 64.0,
          child: Image.asset('assets/jumpingMario.png'));
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: SizedBox(
            width: 64.0,
            height: 64.0,
            child: Image.asset('assets/jumpingMario.png')),
      );
    }
  }
}
