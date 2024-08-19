import 'package:ecommerce_application/components/shared/custom_bottom_navigation.dart';
import 'package:ecommerce_application/views/home/cart_pages.dart/cart_page.dart';
import 'package:ecommerce_application/views/home/lading_pages.dart/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_application/views/home/account_pages/account_page.dart';
import 'package:ecommerce_application/views/home/categories_pages.dart/categories_page.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_application/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _buildWidgetOptions() {
    return <Widget>[
      const LandingPage(),
      const CategoriesPage(),
      const CartPage(),
      const AccountPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);

    return PopScope(
      canPop: homeController.selectedIndex == 0,
      onPopInvoked: (didPop) {
        if (!didPop) {
          setState(() {
            homeController.setSelectedIndex(0);
          });
        }
      },
      child: Scaffold(
        body: _buildWidgetOptions().elementAt(homeController.selectedIndex),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
