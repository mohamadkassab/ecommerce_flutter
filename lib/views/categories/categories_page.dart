import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/app/theme.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'name': 'Electronics', 'icon': Icons.electrical_services},
      {'name': 'Clothing', 'icon': Icons.shopping_bag},
      {'name': 'Home', 'icon': Icons.home},
      {'name': 'Sports', 'icon': Icons.sports_soccer},
      {'name': 'Toys', 'icon': Icons.toys},
      {'name': 'Books', 'icon': Icons.book},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyle(fontWeight: AppConfig.headingFontWeight),
        ),
        automaticallyImplyLeading: false, // This removes the back button
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: scaffoldPadding,
                    mainAxisSpacing: scaffoldPadding,
                    childAspectRatio: 3,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      decoration: BoxDecoration(
                        color: AppConfig.categoriesBackgroundItem,
                        borderRadius:
                            BorderRadius.circular(AppConfig.globalRadius),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            categories[index]['name'],
                            style:
                                TextStyle(fontSize: AppConfig.headingFontSize),
                          ),
                          Icon(
                            categories[index]['icon'],
                            color: AppConfig.tertiary,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
