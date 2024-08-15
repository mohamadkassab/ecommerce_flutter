import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_application/app/app_config.dart';

class ProductsCarousel extends StatefulWidget {
  final List<Map<String, String>> products;

  ProductsCarousel({required this.products});

  @override
  _ProductsCarouselState createState() => _ProductsCarouselState();
}

class _ProductsCarouselState extends State<ProductsCarousel> {
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = 125.0;
    final itemMargin = 15.0;

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        width: screenWidth,
        child: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 220.0, // Adjust height based on content
                viewportFraction: (itemWidth + itemMargin) / screenWidth,
                enableInfiniteScroll: true,
              ),
              items: widget.products.map((product) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: itemWidth,
                      margin: EdgeInsets.symmetric(horizontal: itemMargin / 2),
                      decoration: BoxDecoration(color: AppConfig.surface),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(AppConfig.globalRadius),
                            child: Image.network(
                              product["image"]!,
                              fit: BoxFit.cover,
                              height: itemWidth, // Height and width are equal
                              width: itemWidth, // Makes the image square
                            ),
                          ),
                          SizedBox(height: 5), // Adjusted spacing
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppConfig.globalRadius),
                            child: Text(
                              product["name"]!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppConfig.globalRadius),
                            child: Text(
                              product["price"]!,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppConfig.primary,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppConfig.globalRadius),
                            child: Text(
                              "Label text goes here", // Replace with actual label
                              maxLines: 2, // Limit to 2 lines
                              overflow: TextOverflow
                                  .ellipsis, // Show "..." if text is too long
                              style: TextStyle(
                                fontSize: 12, // Adjust font size as needed
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
