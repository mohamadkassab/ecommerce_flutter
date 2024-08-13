import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/app/themes.dart';
import 'package:ecommerce_application/components/button/location_button.dart';
import 'package:ecommerce_application/components/button/primary_button.dart';
import 'package:ecommerce_application/components/button/secondary_button.dart';
import 'package:ecommerce_application/components/checkbox/checkbox_text.dart';
import 'package:ecommerce_application/components/line/horizontal_line.dart';
import 'package:ecommerce_application/components/button/setting_button.dart';
import 'package:ecommerce_application/components/product/product_cart_details.dart';
import 'package:ecommerce_application/views/signin/forgot_password_form.dart';
import 'package:ecommerce_application/views/signin/otp_form.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
      appBar: AppBar(
        title: Text('Shopping cart'),
      ),
      body: Stack(
        children: [
          // Main content of the page
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                    left: scaffoldPadding,
                    right: scaffoldPadding,
                    bottom: sizedBoxHeight * 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LocationButton(
                      label: 'Beirut',
                      onPressed: () {
                        // Handle profile button press
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckboxText(
                          isSelectAll: _isSelectAll,
                          onSelectAllChanged: _selectAll,
                          sizedBoxHeight: sizedBoxHeight / 2,
                          fontSize: subHeadingFontSize,
                          fontWeight: subHeadingFontWeight,
                          text: "Select all",
                        )
                      ],
                    ),
                    HorizontalLine(
                      thickness: 6,
                    ),
                    Column(
                      children: [
                        ProductCartDetails(),
                        ProductCartDetails(),
                        ProductCartDetails(),
                        ProductCartDetails()
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Sticky button at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: PrimaryButton(
                    onPressed: () {
                      // Handle button press
                    },
                    text: 'Checkout',
                  ),
                ),
                SizedBox(
                  height: sizedBoxHeight / 8,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
