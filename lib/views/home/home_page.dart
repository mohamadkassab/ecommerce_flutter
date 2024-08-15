import 'package:flutter/material.dart';
import 'package:ecommerce_application/app/app_config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_application/components/products/products_carousel.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:ecommerce_application/views/settings/settings_page.dart';
import 'package:ecommerce_application/views/categories/categories_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // products dummy data
  final List<Map<String, String>> _products = [
    {
      "image": "https://i.ebayimg.com/images/g/hyEAAOSw85tfSGn1/s-l1200.jpg",
      "name": "shoes",
      "price": "\$30.00",
    },
    {
      "image":
          "https://veirdo.in/cdn/shop/files/8_2be593bf-344e-4f3a-8a4b-bed67331917f.jpg?v=1707564936",
      "name": "Tshirt",
      "price": "\$40.00",
    },
    {
      "image":
          "https://ca-times.brightspotcdn.com/dims4/default/15a30ea/2147483647/strip/true/crop/6122x4081+0+1/resize/1440x960!/quality/75/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fb3%2F10%2F10c245034893adf233fc1cf3071a%2F1351750-fi-sneaker-buyer-coolkicks-jlc-16185-021.jpg",
      "name": "shoes",
      "price": "\$50.00",
    },
    {
      "image":
          "https://www.realmenrealstyle.com/wp-content/uploads/2023/04/cargo_pants_lower_shot.jpg",
      "name": "Pants",
      "price": "\$60.00",
    },
  ];

  final List<Map<String, String>> _products2 = [
    {
      "image": "https://i.ebayimg.com/images/g/9YwAAOSwSLNic3WH/s-l1200.webp",
      "name": "Case",
      "price": "\$30.00",
    },
    {
      "image":
          "https://m.media-amazon.com/images/I/81XZ-Uz2fZL._AC_UF1000,1000_QL80_.jpg",
      "name": "Car Kit",
      "price": "\$40.00",
    },
    {
      "image":
          "https://i.etsystatic.com/33949597/r/il/d1ac3c/4627272522/il_570xN.4627272522_5q1a.jpg",
      "name": "flower",
      "price": "\$50.00",
    },
    {
      "image":
          "https://i.pinimg.com/564x/8b/72/ff/8b72ffb31e0df0e497d88d17c63197fd.jpg",
      "name": "Suit",
      "price": "\$60.00",
    },
  ];

  List<Widget> _buildWidgetOptions() {
    return <Widget>[
      // Home Page with Carousel
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color:
                  AppConfig.surface, // Set your desired background color here
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    5.0, 30.0, 8.0, 10.0), // Padding: left, top, right, bottom
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 50.0, // Set the desired height here
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppConfig.surface,
                            prefixIconColor: AppConfig.primary,
                            hintText: 'Search...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppConfig.globalRadius)),
                            ),
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: AppConfig
                            .surface, // Background color for the button
                        borderRadius: BorderRadius.circular(
                            AppConfig.globalRadius), // Rounded corners
                      ),
                      child: IconButton(
                        icon: Icon(Icons.notification_important_outlined),
                        color: AppConfig.tertiary,
                        iconSize: 35.0,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                height: AppConfig
                    .sizedBoxHeight), // Add spacing between search bar and carousel

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                height: 200, // Adjust the height as needed
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      AppConfig.globalRadius), // Set the desired border radius
                  child: Image.asset(
                    'assets/images/image4.jpg', // Replace with your image asset path
                    fit: BoxFit.cover, // Adjust the fit property as needed
                  ),
                ),
              ),
            ),

            SizedBox(height: AppConfig.sizedBoxHeight * 2),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'New Arrival',
                    style: TextStyle(
                      fontSize: AppConfig.headingFontSize,
                      fontWeight: AppConfig.headingFontWeight,
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppConfig.tertiary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: AppConfig
                    .sizedBoxHeight), // Add spacing between title and carousel

            ProductsCarousel(products: _products),

            SizedBox(height: AppConfig.sizedBoxHeight),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Best Seller',
                    style: TextStyle(
                      fontSize: AppConfig.headingFontSize,
                      fontWeight: AppConfig.headingFontWeight,
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppConfig.tertiary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: AppConfig
                    .sizedBoxHeight), // Add spacing between title and carousel

            ProductsCarousel(products: _products2),
          ],
        ),
      ),
      CategoriesPage(),
      Center(
        child: Text(
          'Cart Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      SettingsPage(),
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
      // appBar: AppBar(
      //   title: const Text('Home'),
      // ),
      body: _buildWidgetOptions().elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'My Profile',
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
