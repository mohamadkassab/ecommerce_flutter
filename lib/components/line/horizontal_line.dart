import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  final double thickness;
  final double opacity;
  final double padding;

  const HorizontalLine({
    super.key,
    this.thickness = 8,
    this.opacity = 0.1,
    this.padding = 0,
  });

  @override
  Widget build(BuildContext context) {
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
