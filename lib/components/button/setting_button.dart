import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  SettingButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double subHeadingFontSize = AppConfig.subHeadingFontSize;
    final FontWeight subHeadingFontWeight = AppConfig.subHeadingFontWeight;
    final double iconSize = AppConfig.iconSize;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.primary,
        textStyle: TextStyle(
            fontSize: subHeadingFontSize, fontWeight: subHeadingFontWeight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Icon(Icons.arrow_forward_ios, size: iconSize),
        ],
      ),
    );
  }
}
