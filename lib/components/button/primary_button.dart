import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double elevation;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Use the width parameter
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.surface,
          elevation: elevation,
        ),
        child: Text(text),
      ),
    );
  }
}
