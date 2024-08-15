import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/app/theme.dart';
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
    final double notificationSize = AppConfig.notificationSize;
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
        Padding(
          padding: const EdgeInsets.only(
              right:
                  scaffoldPadding), // Adjust the value to move it to the left
          child: IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: onNotificationPressed,
            iconSize: notificationSize,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + bottomPadding);
}
