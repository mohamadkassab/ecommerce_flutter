import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';

class ExpandableInfo extends StatefulWidget {
  final String title;
  final String description;
  final double titleFontSize;

  const ExpandableInfo({
    super.key,
    required this.title,
    required this.description,
    this.titleFontSize = AppConfig.headingFontSize,
  });

  @override
  _ExpandableInfoState createState() => _ExpandableInfoState();
}

class _ExpandableInfoState extends State<ExpandableInfo> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _toggleExpanded,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: widget.titleFontSize,
                  fontWeight: AppConfig.headingFontWeight,
                  color: AppConfig.primary,
                ),
              ),
            ),
            Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              size: AppConfig.iconSize * 1.5,
            ),
          ]),
        ),
        AnimatedCrossFade(
          firstChild: Container(),
          secondChild: Padding(
            padding: const EdgeInsets.only(top: AppConfig.scaffoldPadding / 2),
            child: Text(
              widget.description,
              style: const TextStyle(
                  fontSize: AppConfig.subHeadingFontSize,
                  color: AppConfig.primary),
            ),
          ),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 100),
        ),
      ],
    );
  }
}
