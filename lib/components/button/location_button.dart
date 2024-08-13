import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';

class LocationButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  LocationButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double subHeadingFontSize = AppConfig.subHeadingFontSize;
    final FontWeight subHeadingFontWeight = AppConfig.subHeadingFontWeight;
    final double sizedBoxHeight = AppConfig.sizedBoxHeight;
    final double iconSize = AppConfig.iconSize;
    final double headingFontSize = AppConfig.headingFontSize;
    final FontWeight headingFontWeight = AppConfig.headingFontWeight;

    return Container(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.primary,
          textStyle: TextStyle(
              fontSize: subHeadingFontSize, fontWeight: subHeadingFontWeight),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, size: iconSize),
                SizedBox(
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
