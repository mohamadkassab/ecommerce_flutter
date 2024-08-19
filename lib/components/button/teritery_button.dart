import 'package:flutter/material.dart';

class TeriteryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double elevation;

  const TeriteryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        elevation: elevation,
      ),
      child: Text(text),
    );
  }
}
