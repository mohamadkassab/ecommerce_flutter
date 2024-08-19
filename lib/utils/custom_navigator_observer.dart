import 'package:ecommerce_application/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  final HomeController homeController;

  CustomNavigatorObserver(this.homeController);

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (homeController.selectedIndex != 0) {
      homeController.setSelectedIndex(0);
    }
  }
}
