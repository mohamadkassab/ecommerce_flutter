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
    final double subHeadingFontSize = AppConfig.subHeadingFontSize;
    final FontWeight subHeadingFontWeight = AppConfig.subHeadingFontWeight;
    final double sizedBoxHeight = AppConfig.sizedBoxHeight;
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon, // The icon to display (e.g., favorite, home, etc.)
                color: Theme.of(context).colorScheme.secondary, // Icon color
                size: 34, // Icon size
              ),
              SizedBox(
                width: sizedBoxHeight,
              ),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
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
          HorizontalLine(
            padding: 0,
          ),
        ],
      ),
    );
  }
}
