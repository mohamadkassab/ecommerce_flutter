import 'package:ecommerce_application/app/theme.dart';
import 'package:ecommerce_application/components/shared/price_on_sale.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_application/app/app_config.dart';

class ProductsCarousel extends StatefulWidget {
  final List<Map<String, String>> products;
  final String sectionText;

  ProductsCarousel(
      {super.key, required this.products, required this.sectionText});

  @override
  _ProductsCarouselState createState() => _ProductsCarouselState();
}

class _ProductsCarouselState extends State<ProductsCarousel> {
  // final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = 200.0;
    final itemMargin = 20.0;
    final carouselHeight = 260.0;

    return Container(
      width: screenWidth,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.sectionText,
                style: TextStyle(
                  fontSize: AppConfig.headingFontSize,
                  fontWeight: AppConfig.headingFontWeight,
                ),
              ),
              TextButton(
                child: Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppConfig.tertiary,
                  ),
                ),
                onPressed: () => {},
              ),
            ],
          ),
          SizedBox(height: AppConfig.sizedBoxHeight / 2),
          CarouselSlider(
            options: CarouselOptions(
              height: carouselHeight, // Adjust height based on content
              viewportFraction: (itemWidth + itemMargin) / screenWidth,
              enableInfiniteScroll: true,
            ),
            items: widget.products.map((product) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: itemWidth,
                    margin: EdgeInsets.symmetric(horizontal: itemMargin / 2),
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
                          padding: EdgeInsets.only(
                              left: AppConfig.scaffoldPadding / 2),
                          child: Text(
                            "Label and some description on maximum two lines",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: AppConfig.subHeadingFontSize,
                              fontWeight: AppConfig.subHeadingFontWeight,
                            ),
                          ),
                        ),
                        PriceOnSale(
                          priceBefore: 19.99,
                          priceAfter: 11.53,
                          layout: PriceLayout.row,
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: AppConfig.sizedBoxHeight,
          )
        ],
      ),
    );
  }
}
