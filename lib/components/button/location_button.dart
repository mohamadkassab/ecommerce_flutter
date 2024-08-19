import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';

class LocationButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double iconSize;

  const LocationButton({super.key, 
    required this.label,
    required this.onPressed,
    this.iconSize = AppConfig.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    const double subHeadingFontSize = AppConfig.subHeadingFontSize;
    const FontWeight subHeadingFontWeight = AppConfig.subHeadingFontWeight;
    const double sizedBoxHeight = AppConfig.sizedBoxHeight;
    const double headingFontSize = AppConfig.headingFontSize;
    const FontWeight headingFontWeight = AppConfig.headingFontWeight;

    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.primary,
          textStyle: const TextStyle(
              fontSize: subHeadingFontSize, fontWeight: subHeadingFontWeight),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: iconSize,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                const SizedBox(
                  width: sizedBoxHeight,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Ship to ",
                    style: TextStyle(
                      fontSize: subHeadingFontSize,
                      fontWeight: subHeadingFontWeight,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  TextSpan(
                    text: label,
                    style: TextStyle(
                      fontSize: headingFontSize,
                      fontWeight: headingFontWeight,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ])),
              ],
            ),
            Icon(Icons.arrow_forward_ios, size: iconSize),
          ],
        ),
      ),
    );
  }
}
