import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/components/button/location_button.dart';
import 'package:ecommerce_application/components/button/primary_button.dart';
import 'package:ecommerce_application/components/checkbox/checkbox_text.dart';
import 'package:ecommerce_application/components/line/horizontal_line.dart';
import 'package:ecommerce_application/components/product/product_cart_details.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _isSelectAll = false;

  void _selectAll(bool? value) {
    setState(() {
      _isSelectAll = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double sizedBoxHeight = AppConfig.sizedBoxHeight;
    final double scaffoldPadding = AppConfig.scaffoldPadding;
    final double subHeadingFontSize = AppConfig.subHeadingFontSize;
    final FontWeight subHeadingFontWeight = AppConfig.subHeadingFontWeight;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontWeight: AppConfig.headingFontWeight),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  LocationButton(
                    label: 'Beirut',
                    onPressed: () {
                      // Handle profile button press
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: scaffoldPadding,
                      right: scaffoldPadding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckboxText(
                          isSelectAll: _isSelectAll,
                          onSelectAllChanged: _selectAll,
                          sizedBoxHeight: sizedBoxHeight / 2,
                          fontSize: subHeadingFontSize,
                          fontWeight: subHeadingFontWeight,
                          text: "Select all",
                        ),
                      ],
                    ),
                  ),
                  const HorizontalLine(thickness: 6),
                  // Use ListView.builder for dynamic list
                  Padding(
                    padding: EdgeInsets.only(
                      left: scaffoldPadding,
                      right: scaffoldPadding,
                      bottom: sizedBoxHeight * 4,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4, // Adjust this count as needed
                      itemBuilder: (context, index) {
                        return ProductCartDetails();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: PrimaryButton(
                    onPressed: () {
                      // Handle button press
                    },
                    text: 'Checkout',
                  ),
                ),
                SizedBox(height: AppConfig.sizedBoxHeight / 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
