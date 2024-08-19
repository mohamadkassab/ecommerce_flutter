import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/app/theme.dart';
import 'package:flutter/material.dart';

class SearchAppBarIcon extends StatelessWidget implements PreferredSizeWidget {
  final double bottomPadding;
  final Function() onIconPressed;
  final VoidCallback onSearch;
  final bool implyLeading;
  final Icon icon;

  const SearchAppBarIcon(
      {super.key,
      this.bottomPadding = 10.0,
      required this.onIconPressed,
      required this.onSearch,
      this.implyLeading = true,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    const double notificationSize = AppConfig.notificationSize;
    return AppBar(
      automaticallyImplyLeading: implyLeading,
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: TextField(
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
              hintText: 'Search',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.search),
              isDense: true,
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface),
          onSubmitted: (String searchText) {
            if (searchText.isNotEmpty) {
              onSearch();
            }
          }),
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
            icon: icon,
            onPressed: onIconPressed,
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
