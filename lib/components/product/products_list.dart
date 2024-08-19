import 'package:flutter/material.dart';
import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/components/shared/price_on_sale.dart';

class ProductsList extends StatefulWidget {
  final List<Map<String, String>> products;
  final String sectionText;

  const ProductsList({
    super.key,
    required this.products,
    required this.sectionText,
  });

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  static const double productItemWidth = 200.0;
  static const double productItemMargin = 20.0;
  static const double carouselHeight = 260.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/product_details");
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.sectionText,
                style: const TextStyle(
                  fontSize: AppConfig.headingFontSize,
                  fontWeight: AppConfig.headingFontWeight,
                ),
              ),
              TextButton(
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppConfig.tertiary,
                  ),
                ),
                onPressed: () {
                  // TODO: Add action
                },
              ),
            ],
          ),
          const SizedBox(height: AppConfig.sizedBoxHeight / 2),
          SizedBox(
            height: carouselHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.products.length,
              itemBuilder: (context, index) {
                return Container(
                  width: productItemWidth,
                  margin: EdgeInsets.only(
                    left: index == 0
                        ? AppConfig.scaffoldPadding
                        : productItemMargin / 2,
                    right: index == widget.products.length - 1
                        ? AppConfig.scaffoldPadding
                        : productItemMargin / 2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppConfig.globalRadius),
                        child: Image.network(
                          widget.products[index]["image"]!,
                          fit: BoxFit.cover,
                          height: productItemWidth,
                          width: productItemWidth,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Padding(
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
                      const PriceOnSale(
                        priceBefore: 19.99,
                        priceAfter: 11.53,
                        layout: PriceLayout.row,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: AppConfig.sizedBoxHeight)
        ],
      ),
    );
  }
}
