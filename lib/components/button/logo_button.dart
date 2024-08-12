import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoButton extends StatelessWidget {
  final SvgPicture icon;
  final String text;
  final VoidCallback onPressed;
  final double logoHeight;
  final double buttonWidth;
  final double buttonBorderWidth;
  final double elevation;
  final double sizedBoxWidth;

  const LogoButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.logoHeight = 24,
    this.buttonWidth = double.infinity,
    this.buttonBorderWidth = 1.0,
    this.elevation = 0,
    this.sizedBoxWidth = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              Theme.of(context).colorScheme.surface, // Background color
          foregroundColor: Theme.of(context).colorScheme.primary, // Text color
          side: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: buttonBorderWidth), // Border color
          elevation: elevation,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            SizedBox(width: sizedBoxWidth),
            Text(text),
          ],
        ),
      ),
    );
  }
}
