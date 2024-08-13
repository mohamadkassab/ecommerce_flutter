import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  TransparentButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final double subHeadingFontSize = AppConfig.subHeadingFontSize;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
            color: Theme.of(context).colorScheme.primary), // Border color
        foregroundColor: Theme.of(context).colorScheme.primary, // Text color
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis, // Ensures text stays on one line
        style: TextStyle(
          fontSize: subHeadingFontSize,
        ),
      ),
    );
  }
}
