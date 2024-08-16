import 'package:ecommerce_application/components/app_bar/search_app_bar_notification.dart';
import 'package:ecommerce_application/views/cart/cart_page.dart';
import 'package:ecommerce_application/views/home/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_application/app/app_config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_application/components/product/products_carousel.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:ecommerce_application/views/account/account_page.dart';
import 'package:ecommerce_application/views/categories/categories_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _buildWidgetOptions() {
    return <Widget>[
      // Home Page with Carousel
      LandingPage(),
      CategoriesPage(),
      CartPage(),
      AccountPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildWidgetOptions().elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        selectedItemColor: AppConfig.tertiary,
        unselectedItemColor: AppConfig.secondary,
        onTap: _onItemTapped,
      ),
    );
  }
}
