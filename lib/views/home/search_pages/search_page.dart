import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/components/app_bar/search_app_bar_icon.dart';
import 'package:ecommerce_application/components/button/secondary_button.dart';
import 'package:ecommerce_application/components/button/transparent_button.dart';
import 'package:ecommerce_application/components/product/product_search_details.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String searchText;
  const SearchPage({super.key, this.searchText = ""});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final double sizedBoxHeight = AppConfig.sizedBoxHeight;
  final double titleFontSize = AppConfig.titleFontSize;
  final FontWeight titleFontWeight = AppConfig.titleFontWeight;
  final double subHeadingFontSize = AppConfig.subHeadingFontSize;
  final FontWeight subHeadingFontWeight = AppConfig.subHeadingFontWeight;
  final double noteFontSize = AppConfig.noteFontSize;
  final FontWeight noteFontWeight = AppConfig.noteFontWeight;
  final double headingFontSize = AppConfig.headingFontSize;
  final FontWeight headingFontWeight = AppConfig.headingFontWeight;
  final String mainLogoPath = AppConfig.mainLogoPath;
  final double scaffoldPadding = AppConfig.scaffoldPadding;
  final double mainLogoHeight = AppConfig.mainLogoHeight;
  bool _isSelectAll = false;

  void _selectAll(bool? value) {
    setState(() {
      _isSelectAll = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBarIcon(
        onIconPressed: () => {},
        onSearch: () => {},
        icon: const Icon(Icons.notifications),
      ),
      body:
          // Main content of the page
          SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: scaffoldPadding,
              right: scaffoldPadding,
              bottom: sizedBoxHeight * 4,
              top: sizedBoxHeight),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TransparentButton(text: 'All', onPressed: () => {}),
                    SizedBox(
                      width: scaffoldPadding / 2,
                    ),
                    TransparentButton(text: 'Processing', onPressed: () => {}),
                    SizedBox(
                      width: scaffoldPadding / 2,
                    ),
                    TransparentButton(text: 'Shipped', onPressed: () => {}),
                    SizedBox(
                      width: scaffoldPadding / 2,
                    ),
                    TransparentButton(text: 'Cancelled', onPressed: () => {}),
                    SizedBox(
                      width: scaffoldPadding / 2,
                    ),
                    TransparentButton(text: 'Cancelled', onPressed: () => {}),
                    SizedBox(
                      width: scaffoldPadding / 2,
                    ),
                    TransparentButton(text: 'Cancelled', onPressed: () => {}),
                  ],
                ),
              ),
              SizedBox(
                height: scaffoldPadding,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "1243 Results",
                    style: TextStyle(
                        fontSize: subHeadingFontSize,
                        fontWeight: subHeadingFontWeight),
                  ),
                  SecondaryButton(text: "Filter & Sort", onPressed: () => {})
                ],
              ),
              SizedBox(
                height: scaffoldPadding,
              ),
              const Column(
                children: [
                  ProductSearchDetails(),
                  ProductSearchDetails(),
                  ProductSearchDetails(),
                  ProductSearchDetails()
                ],
              ),
            ],
          ),
        ),
      ),
      // Sticky button at the bottom
    );
  }
}
