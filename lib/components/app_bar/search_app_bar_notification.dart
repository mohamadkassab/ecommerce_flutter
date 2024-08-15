import 'package:flutter/material.dart';

class SearchAppBarNotification extends StatelessWidget
    implements PreferredSizeWidget {
  final double bottomPadding;
  final Function() onNotificationPressed;

  const SearchAppBarNotification({
    Key? key,
    this.bottomPadding = 10.0,
    required this.onNotificationPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: TextField(
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
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_none_outlined),
          onPressed: onNotificationPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + bottomPadding);
}
