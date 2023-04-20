import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Icon icon;
  final function;
  static bool holdingButton = false;

  const DefaultButton({Key? key, required this.icon, this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    bool userIsHoldingButton() {
      return holdingButton;
    }

    return GestureDetector(
      onTapDown: (details) {
        holdingButton = true;
        function();
      },
      onTap: () {
        holdingButton = false;
      },
      child: Container(
        decoration: BoxDecoration(
          color: colors.primary,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: icon,
        ),
      ),
    );
  }
}
