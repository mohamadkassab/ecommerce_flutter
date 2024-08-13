import 'package:flutter/material.dart';

class CheckboxText extends StatelessWidget {
  final bool isSelectAll;
  final ValueChanged<bool?>? onSelectAllChanged;
  final double sizedBoxHeight;
  final double fontSize;
  final FontWeight fontWeight;
  final String text;

  const CheckboxText({
    Key? key,
    required this.isSelectAll,
    required this.onSelectAllChanged,
    this.text = "Select",
    this.sizedBoxHeight = 8.0,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: isSelectAll, onChanged: onSelectAllChanged),
        SizedBox(
          width: sizedBoxHeight / 2,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: fontSize, fontWeight: fontWeight),
        ),
      ],
    );
  }
}
