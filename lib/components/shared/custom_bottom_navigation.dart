import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_application/controllers/home_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: 'Account',
        ),
      ],
      currentIndex: homeController.selectedIndex,
      selectedItemColor: AppConfig.tertiary,
      unselectedItemColor: AppConfig.secondary,
      onTap: (int index) {
        homeController.setSelectedIndex(index);
        final NavigatorState navigator = Navigator.of(context);
        while (navigator.canPop() &&
            ModalRoute.of(navigator.context)?.settings.name != '/home') {
          navigator.pop();
        }
      },
    );
  }
}
