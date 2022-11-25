import 'package:flutter/material.dart';

class MultiTextButton extends StatelessWidget {
  const MultiTextButton({
    Key? key,
    required this.onPressed,
    required this.children,
    this.overlayColor,
  }) : super(key: key);
  final List<Text> children;
  final VoidCallback onPressed;
  final MaterialStateProperty<Color>? overlayColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: overlayColor ??
            MaterialStateProperty.all(
              Colors.transparent,
            ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
