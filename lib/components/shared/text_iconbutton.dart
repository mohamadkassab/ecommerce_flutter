import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/components/line/horizontal_line.dart';
import 'package:flutter/material.dart';

class TextIconbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double elevation;
  final Icon iconButton;
  final IconData icon;

  const TextIconbutton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.elevation = 0,
    required this.iconButton,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    const double subHeadingFontSize = AppConfig.subHeadingFontSize;
    const FontWeight subHeadingFontWeight = AppConfig.subHeadingFontWeight;
    const double sizedBoxHeight = AppConfig.sizedBoxHeight;
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon, // The icon to display (e.g., favorite, home, etc.)
                color: Theme.of(context).colorScheme.secondary, // Icon color
                size: 34, // Icon size
              ),
              const SizedBox(
                width: sizedBoxHeight,
              ),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: subHeadingFontSize,
                      fontWeight: subHeadingFontWeight),
                ),
              ),
              IconButton(
                icon: iconButton,
                onPressed: () {
                  onPressed();
                },
              ),
            ],
          ),
          const HorizontalLine(
            padding: 0,
          ),
        ],
      ),
    );
  }
}
