import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/app/theme.dart';
import 'package:ecommerce_application/components/app_bar/search_app_bar_notification.dart';
import 'package:ecommerce_application/components/button/location_button.dart';
import 'package:ecommerce_application/components/button/primary_button.dart';
import 'package:ecommerce_application/components/button/secondary_button.dart';
import 'package:ecommerce_application/components/button/transparent_button.dart';
import 'package:ecommerce_application/components/checkbox/checkbox_text.dart';
import 'package:ecommerce_application/components/line/horizontal_line.dart';
import 'package:ecommerce_application/components/button/setting_button.dart';
import 'package:ecommerce_application/components/product/product_cart_details.dart';
import 'package:ecommerce_application/components/product/product_search_details.dart';
import 'package:ecommerce_application/components/product/products_carousel.dart';
import 'package:ecommerce_application/views/signin/forgot_password_form.dart';
import 'package:ecommerce_application/views/signin/otp_form.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final double scaffoldPadding = AppConfig.scaffoldPadding;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBarNotification(
        onNotificationPressed: () => {},
        onSearch: () => {Navigator.pushNamed(context, "/search")},
        implyLeading: false,
      ),
      body:
          // Main content of the page
          SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(scaffoldPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 200, // Adjust the height as needed
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppConfig
                        .globalRadius), // Set the desired border radius
                    child: Image.asset(
                      'assets/images/image4.jpg', // Replace with your image asset path
                      fit: BoxFit.cover, // Adjust the fit property as needed
                    ),
                  ),
                ),
                SizedBox(height: AppConfig.sizedBoxHeight * 2),
                ProductsCarousel(
                    sectionText: "New Arrival", products: _products),
                ProductsCarousel(
                    sectionText: "Best Seller", products: _products2),
              ],
            ),
          ),
        ),
      ),
      // Sticky button at the bottom
    );
  }
}
