import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  final String text;
  final double thickness;

  const HorizontalLine({
    super.key,
     this.text = "or",
     this.thickness = 1,
     });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child:  Divider(thickness: thickness, color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        Text(
          text,
          style:
               TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child:  Divider(thickness: thickness, color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ],
    );
  }
}
