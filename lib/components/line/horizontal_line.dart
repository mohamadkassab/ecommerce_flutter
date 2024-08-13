import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  final double thickness;
  final double opacity;

  const HorizontalLine({
    super.key,
    this.thickness = 8,
    this.opacity = 0.1,
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
                color: Theme.of(context)
                    .colorScheme
                    .secondary
                    .withOpacity(opacity)),
          ),
        ),
      ],
    );
  }
}
