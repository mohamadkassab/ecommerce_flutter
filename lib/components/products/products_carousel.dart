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
    final itemWidth = 150.0;
    final itemMargin = 15.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: screenWidth,
        child: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                viewportFraction: (itemWidth + itemMargin) / screenWidth,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
              items: widget.products.map((product) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: itemWidth,
                      margin: EdgeInsets.symmetric(
                          horizontal:
                              itemMargin / 2), // Apply half margin on each side
                      decoration: BoxDecoration(color: AppConfig.surface),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.network(
                            product["image"]!,
                            fit: BoxFit.cover,
                            height: 100,
                            width:
                                itemWidth, // Match the width of the container
                          ),
                          SizedBox(height: 10),
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
                                color: Colors.grey,
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
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {},
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
