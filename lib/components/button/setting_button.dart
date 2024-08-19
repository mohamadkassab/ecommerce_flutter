import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const SettingButton({super.key, 
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    const double subHeadingFontSize = AppConfig.subHeadingFontSize;
    const FontWeight subHeadingFontWeight = AppConfig.subHeadingFontWeight;
    const double iconSize = AppConfig.iconSize;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.primary,
        textStyle: const TextStyle(
            fontSize: subHeadingFontSize, fontWeight: subHeadingFontWeight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          const Icon(Icons.arrow_forward_ios, size: iconSize),
        ],
      ),
    );
  }
}
