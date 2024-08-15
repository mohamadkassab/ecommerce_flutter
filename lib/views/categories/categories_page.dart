import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  // Dummy data for categories
  final List<Map<String, dynamic>> categories = [
    {'name': 'Electronics', 'icon': Icons.electrical_services},
    {'name': 'Clothing', 'icon': Icons.shopping_bag},
    {'name': 'Home', 'icon': Icons.home},
    {'name': 'Sports', 'icon': Icons.sports_soccer},
    {'name': 'Toys', 'icon': Icons.toys},
    {'name': 'Books', 'icon': Icons.book},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Categories'),
      //   // You can add additional AppBar customization here
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 30.0, 8.0, 5.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize:
                        AppConfig.titleFontSize, // Adjust font size as needed
                    fontWeight: AppConfig
                        .titleFontWeight, // Adjust font weight as needed
                  ),
                ),
              ),
              SizedBox(height: 16.0), // Spacing between title and categories

              // Categories Grid
              for (int i = 0; i < categories.length; i += 2)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        decoration: BoxDecoration(
                          color: AppConfig
                              .categoriesBackgroundItem, // Light grey background color
                          borderRadius: BorderRadius.circular(
                              AppConfig.globalRadius), // Rounded corners
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              categories[i]['name'],
                              style: TextStyle(
                                  fontSize: AppConfig
                                      .headingFontSize), // Adjust font size as needed
                            ),
                            Icon(
                              categories[i]['icon'],
                              color: AppConfig.tertiary, // Green icon color
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (i + 1 <
                        categories
                            .length) // Check if there is a second item in the row
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          decoration: BoxDecoration(
                            color: AppConfig
                                .categoriesBackgroundItem, // Light grey background color
                            borderRadius:
                                BorderRadius.circular(8.0), // Rounded corners
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                categories[i + 1]['name'],
                                style: TextStyle(
                                    fontSize: AppConfig
                                        .headingFontSize), // Adjust font size as needed
                              ),
                              Icon(
                                categories[i + 1]['icon'],
                                color: AppConfig.tertiary, // Green icon color
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
