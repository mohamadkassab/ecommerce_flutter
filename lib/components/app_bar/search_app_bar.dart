import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double bottomPadding;
  final Function() onNotificationPressed;

  const SearchAppBar({
    super.key,
    this.bottomPadding = 10.0,
    required this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: const TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          isDense: true,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(bottomPadding),
        child: Padding(
          padding: EdgeInsets.only(bottom: bottomPadding),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + bottomPadding);
}
