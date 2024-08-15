import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double buttonWidth;
  final double buttonBorderWidth;
  final double elevation;
  final double sizedBoxWidth;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonWidth = double.infinity,
    this.buttonBorderWidth = 1.0,
    this.elevation = 0,
    this.sizedBoxWidth = 8,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            Theme.of(context).colorScheme.surface, // Background color
        foregroundColor: Theme.of(context).colorScheme.primary, // Text color
        side: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: buttonBorderWidth), // Border color
        elevation: elevation,
        padding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0), // Adjust the vertical padding here
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text),
        ],
      ),
    );
  }
}
