import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/app/theme.dart';
import 'package:ecommerce_application/components/app_bar/search_app_bar.dart';
import 'package:ecommerce_application/components/app_bar/search_app_bar_notification.dart';
import 'package:ecommerce_application/components/button/primary_button.dart';
import 'package:ecommerce_application/components/button/secondary_button.dart';
import 'package:ecommerce_application/components/button/transparent_button.dart';
import 'package:ecommerce_application/components/line/horizontal_line.dart';
import 'package:ecommerce_application/components/button/setting_button.dart';
import 'package:ecommerce_application/views/signin/forgot_password_form.dart';
import 'package:ecommerce_application/views/signin/otp_form.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
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
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBarNotification(
        onNotificationPressed: () => {},
        onSearch: () => {},
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TransparentButton(text: 'All', onPressed: () => {}),
                    SizedBox(
                      width: scaffoldPadding / 2,
                    ),
                    TransparentButton(text: 'Processing', onPressed: () => {}),
                    SizedBox(
                      width: scaffoldPadding / 2,
                    ),
                    TransparentButton(text: 'Shipped', onPressed: () => {}),
                    SizedBox(
                      width: scaffoldPadding / 2,
                    ),
                    TransparentButton(text: 'Cancelled', onPressed: () => {}),
                  ],
                ),
              ),
              SizedBox(
                height: scaffoldPadding,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/empty_cart.png',
                      width: 100, // Adjust the width as needed
                      height: 100, // Adjust the height as needed
                    ),
                    SizedBox(
                      height: scaffoldPadding,
                    ),
                    Text(
                      "No Orders Here",
                      style: TextStyle(
                          fontSize: subHeadingFontSize,
                          fontWeight: headingFontWeight),
                    ),
                    SizedBox(
                      height: scaffoldPadding,
                    ),
                    PrimaryButton(
                      onPressed: () => {},
                      text: "Start Exploring",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
