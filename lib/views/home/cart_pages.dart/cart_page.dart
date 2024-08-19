import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/components/button/location_button.dart';
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
    const double sizedBoxHeight = AppConfig.sizedBoxHeight;
    const double scaffoldPadding = AppConfig.scaffoldPadding;
    const double subHeadingFontSize = AppConfig.subHeadingFontSize;
    const FontWeight subHeadingFontWeight = AppConfig.subHeadingFontWeight;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontWeight: AppConfig.headingFontWeight),
        ),
        automaticallyImplyLeading: false, // This removes the back button
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              LocationButton(
                label: 'Beirut',
                iconSize: 26,
                onPressed: () {
                  // Handle profile button press
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
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
                padding: const EdgeInsets.only(
                  left: scaffoldPadding,
                  right: scaffoldPadding,
                  bottom: sizedBoxHeight * 4,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4, // Adjust this count as needed
                  itemBuilder: (context, index) {
                    return const ProductCartDetails();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Action to perform when the button is pressed
          print('Checkout Button Pressed!');
        },
        label: Text(
          'Checkout',
          style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontSize: subHeadingFontSize),
        ), // Text to display// Icon to display
        backgroundColor: Theme.of(context)
            .colorScheme
            .tertiary, // Optional: Customize the button's color
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
