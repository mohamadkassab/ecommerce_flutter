import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_application/components/products/products_carousel.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetailsPage> {
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

  final List<String> sizeOptions = [
    'Small',
    'Medium',
    'Large',
    'X-Large',
    // '43',
    // '44',
    // 'red',
    // 'blue'
  ];

  int _currentIndex = 0;
  int _quantity = 1;
  String? _selectedSize;

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
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20), // Spacer between search and share icon
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                // Handle share action
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Consistent padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Name and Label
              Text(
                productData['name'],
                style: TextStyle(
                    fontSize: AppConfig.titleFontSize,
                    fontWeight: AppConfig.titleFontWeight),
              ),
              SizedBox(height: 8),
              Text(
                'Attributes: ${productData['attributes']}',
                style: TextStyle(
                    fontSize: AppConfig.subTitleFontSize,
                    color: AppConfig.secondary),
              ),
              SizedBox(height: 16),

              // Carousel Slider with Padding
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: CarouselSlider.builder(
                  itemCount: imgList.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 0.0), // No horizontal padding
                      child: Image.network(
                        imgList[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 400.0,
                    viewportFraction: 1.0,
                    autoPlay: true,
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
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
              SizedBox(height: 16),

              // Size Options (Centered, Wrap, and No Default Selection)
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0, // Horizontal spacing between items
                runSpacing: 4.0, // Vertical spacing between lines
                children:
                    sizeOptions.map((size) => _buildSizeOption(size)).toList(),
              ),
              SizedBox(height: 16),

              // Price, Quantity, and Shipping Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${productData['price']}',
                    style: TextStyle(
                        fontSize: AppConfig.headingFontSize,
                        color: Colors.blue),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (_quantity > 1) _quantity--;
                          });
                        },
                      ),
                      Text(
                        '$_quantity',
                        style:
                            TextStyle(fontSize: AppConfig.subHeadingFontSize),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Shipment Cost: \$${productData['shipmentCost']}',
                style: TextStyle(fontSize: AppConfig.subHeadingFontSize),
              ),
              SizedBox(height: 8),
              Text(
                'Estimated Delivery: ${productData['estimatedDelivery']}',
                style: TextStyle(fontSize: AppConfig.subHeadingFontSize),
              ),
              SizedBox(height: 16),

              // Product Description
              Text(
                productData['description'],
                style: TextStyle(fontSize: AppConfig.subHeadingFontSize),
              ),
              SizedBox(height: 16),

              // Additional Details
              Text(
                productData['additionalDetails'],
                style: TextStyle(fontSize: AppConfig.subHeadingFontSize),
              ),
              SizedBox(height: 16), // Space for floating button

              // Best Seller Title and See All Text
              SizedBox(height: AppConfig.sizedBoxHeight),
              // Padding(
              // padding: const EdgeInsets.all(16.0), // Match previous padding
              // child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'You might also like',
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

              SizedBox(
                  height: AppConfig
                      .sizedBoxHeight), // Space between title and carousel

              // Products Carousel
              ProductsCarousel(products: _products2),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Handle add to cart action
          },
          label: Text('Add to Cart'),
          icon: Icon(Icons.shopping_cart),
          backgroundColor: AppConfig.tertiary),
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
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
