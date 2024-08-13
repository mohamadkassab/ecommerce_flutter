import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';

class HorizontaTextlLine extends StatelessWidget {
  final String text;
  final double thickness;

  const HorizontaTextlLine({
    super.key,
    this.text = "or",
    this.thickness = 1,
  });

  @override
  Widget build(BuildContext context) {
    final double padding = AppConfig.scaffoldPadding;
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: padding),
            child: Divider(
                thickness: thickness,
                color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        Text(
          text,
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: padding),
            child: Divider(
                thickness: thickness,
                color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ],
    );
  }
}
