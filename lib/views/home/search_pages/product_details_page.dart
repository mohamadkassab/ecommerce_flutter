import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/app/theme.dart';
import 'package:ecommerce_application/components/app_bar/search_app_bar_icon.dart';
import 'package:ecommerce_application/components/button/primary_button.dart';
import 'package:ecommerce_application/components/button/teritery_button.dart';
import 'package:ecommerce_application/components/product/products_list.dart';
import 'package:ecommerce_application/components/shared/custom_bottom_navigation.dart';
import 'package:ecommerce_application/components/shared/expandable_info.dart';
import 'package:ecommerce_application/components/shared/price_on_sale.dart';
import 'package:ecommerce_application/components/shared/quantity_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
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

  final List<String> imgList = [
    'https://www.hudsonwellesley.com/cdn/shop/products/Black_Tee_Front_1024x1024@2x.png?v=1582411399',
    'https://www.trueclassictees.com/cdn/shop/files/4000_BLACK_2.jpg?v=1710264591',
    'https://r2.erweima.ai/imgcompressed/compressed_b4a885ee4406d0aaf26e9e020e3b1112.webp',
    'https://communityclothing.co.uk/cdn/shop/files/Female_Classic-T-Shirt_Black_Front_Portrait_4f1b3dcc-9d11-4b63-b6d2-d95b01d7f35b_2048x.jpg?v=1694642896',
    // 'https://via.placeholder.com/600x400.png?text=Image+5',
    // 'https://via.placeholder.com/600x400.png?text=Image+6',
  ];

  Map<String, dynamic> attributes = {
    'size': [
      "small",
      "medium",
      "large",
      "medium",
      "large",
      "medium",
      "large",
      "medium",
      "large",
      "medium",
      "large",
      "medium",
      "large",
      "medium",
      "large",
      "medium",
      "large"
    ],
    'color': ['blue', 'green', 'red'],
  };

  int _currentIndex = 0;
  final int _quantity = 1;
  String? _selectedSize;
  String? selectedValue;

  final Map<String, dynamic> productData = {
    'name': 'Black T-shirt',
    'attributes': 'Versatile Blank Black TShirt Mockup for Custom Designs',
    'price': 15.50,
    'description':
        'This is a description of the product. It provides details about the features, benefits, and specifications of the product.',
    'shipmentCost': 5.00,
    'estimatedDelivery': '3-5 Days',
    'additionalDetails': 'Includes warranty, care instructions, etc.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBarIcon(
        onIconPressed: () => {},
        onSearch: () => {},
        icon: const Icon(Icons.share),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(scaffoldPadding), // Consistent padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Name and Label
              Text(
                productData['name'],
                style: const TextStyle(
                    fontSize: AppConfig.headingFontSize,
                    fontWeight: AppConfig.headingFontWeight),
              ),
              const SizedBox(height: AppConfig.sizedBoxHeight / 2),
              Text(
                'Label: ${productData['attributes']}',
                style: const TextStyle(
                    fontSize: AppConfig.subHeadingFontSize,
                    fontWeight: AppConfig.subHeadingFontWeight),
              ),
              const SizedBox(height: AppConfig.sizedBoxHeight),

              // Carousel Slider with Padding
              Container(
                child: CarouselSlider.builder(
                  itemCount: imgList.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      // No horizontal padding
                      child: Image.network(
                        imgList[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 400.0,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              // Carousel Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (AppConfig.tertiary).withOpacity(
                          _currentIndex == entry.key ? 0.9 : 0.4,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: AppConfig.sizedBoxHeight),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: attributes.entries.map((entry) {
                  String key = entry.key;
                  List<String> values = List<String>.from(entry.value);
                  String selectedValue = values.first;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        key,
                        style: const TextStyle(
                            fontSize: AppConfig.headingFontSize,
                            fontWeight: AppConfig.subHeadingFontWeight),
                      ),
                      const SizedBox(
                        height: AppConfig.sizedBoxHeight / 2,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: values.map((item) {
                            return GestureDetector(
                              onTap: () => {},
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: key == "color"
                                      ? BoxShape.circle
                                      : BoxShape.rectangle,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                child: Image.asset(
                                  AppConfig.mainLogoPath,
                                  height: AppConfig.mainLogoHeight,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: AppConfig.sizedBoxHeight,
                      ),
                    ],
                  );
                }).toList(),
              ),

              const SizedBox(
                height: AppConfig.sizedBoxHeight,
              ),

              // Price, Quantity, and Shipping Info
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PriceOnSale(priceBefore: 19, priceAfter: 14),
                  QuantityDropdown(),
                ],
              ),

              const SizedBox(
                height: AppConfig.sizedBoxHeight / 2,
              ),
              Text(
                'Estimated Delivery: ${productData['estimatedDelivery']}',
                style: const TextStyle(fontSize: AppConfig.subHeadingFontSize),
              ),
              const SizedBox(
                height: AppConfig.sizedBoxHeight / 2,
              ),

              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        text: "Buy Now",
                        onPressed: () => {},
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppConfig.sizedBoxHeight / 2,
                  ), // Optional spacing between buttons
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: TeriteryButton(
                        text: "Add to Cart",
                        onPressed: () => {},
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: AppConfig.sizedBoxHeight,
              ),
              // Product Description
              Text(
                productData['description'],
                style: const TextStyle(fontSize: AppConfig.subHeadingFontSize),
              ),
              const SizedBox(
                height: AppConfig.sizedBoxHeight * 2,
              ),
              const ExpandableInfo(
                  title: 'Product Description',
                  description:
                      "High quality material Available in various sizes 1-year warranty include Eco-friendly production"),
              const SizedBox(
                height: AppConfig.sizedBoxHeight,
              ),
              const ExpandableInfo(
                  title: 'Product style',
                  description:
                      "High quality material Available in various sizes 1-year warranty include Eco-friendly production asdasd"),
              const SizedBox(
                height: AppConfig.sizedBoxHeight,
              ),

              // Products Carousel
              ProductsList(sectionText: "x", products: _products2),

              const SizedBox(height: AppConfig.sizedBoxHeight * 3),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     onPressed: () {
      //       // Handle add to cart action
      //     },
      //     label: Text(
      //       'Add to Cart',
      //       style: TextStyle(
      //           color: Theme.of(context).colorScheme.surface,
      //           fontSize: AppConfig.subHeadingFontSize),
      //     ),
      //     icon: Icon(
      //       Icons.shopping_cart_checkout,
      //       color: AppConfig.surface,
      //     ),
      //     backgroundColor: AppConfig.tertiary),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget _buildSizeOption(String size) {
    bool isSelected = _selectedSize == size;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSize = size;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isSelected ? AppConfig.tertiary : Colors.grey[300],
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: isSelected ? AppConfig.tertiary : Colors.grey,
          ),
        ),
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
