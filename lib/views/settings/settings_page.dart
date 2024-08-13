import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/app/themes.dart';
import 'package:ecommerce_application/components/button/primary_button.dart';
import 'package:ecommerce_application/components/button/secondary_button.dart';
import 'package:ecommerce_application/components/line/horizontal_line.dart';
import 'package:ecommerce_application/components/button/setting_button.dart';
import 'package:ecommerce_application/views/signin/forgot_password_form.dart';
import 'package:ecommerce_application/views/signin/otp_form.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(scaffoldPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hello Mohamad',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: headingFontSize,
                        fontWeight: headingFontWeight),
                  ),
                ),
                SizedBox(height: sizedBoxHeight / 2),
                HorizontalLine(),
                SizedBox(height: sizedBoxHeight / 2),
                Wrap(
                  spacing:
                      sizedBoxHeight, // Horizontal spacing between the children
                  runSpacing: sizedBoxHeight, // Vertical spacing between rows
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          sizedBoxHeight * 2,
                      child:
                          SecondaryButton(text: "Orders", onPressed: () => {
                            Navigator.pushNamed(context, "/orders"),
                          }),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          sizedBoxHeight * 2,
                      child:
                          SecondaryButton(text: "Account", onPressed: () => {}),
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          sizedBoxHeight * 2,
                      child: SecondaryButton(
                          text: "Language/Currency", onPressed: () => {}),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          sizedBoxHeight * 2,
                      child: SecondaryButton(
                          text: "Customer Service", onPressed: () => {}),
                    ),

                    // Add more widgets here
                  ],
                ),
                SizedBox(height: sizedBoxHeight / 2),
                HorizontalLine(),
                SizedBox(height: sizedBoxHeight / 2),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: scaffoldPadding / 2),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Settings",
                      style: TextStyle(
                          fontSize: headingFontSize,
                          fontWeight: headingFontWeight),
                    ),
                  ),
                ),
                SizedBox(height: sizedBoxHeight / 2),
                SettingButton(
                  label: 'Payments',
                  onPressed: () {
                    // Handle profile button press
                  },
                ),
                SettingButton(
                  label: 'Addresses',
                  onPressed: () {
                    // Handle profile button press
                  },
                ),
                SettingButton(
                  label: 'Notifications',
                  onPressed: () {
                    // Handle profile button press
                  },
                ),
                SettingButton(
                  label: 'Privacy Policy',
                  onPressed: () {
                    // Handle profile button press
                  },
                ),
                SettingButton(
                  label: 'Terms and conditions',
                  onPressed: () {
                    // Handle profile button press
                  },
                ),
                SettingButton(
                  label: 'About',
                  onPressed: () {
                    // Handle profile button press
                  },
                ),
                HorizontalLine(),
                SizedBox(height: sizedBoxHeight / 2),
                SizedBox(
                  width: double.infinity,
                  child: SecondaryButton(text: "Sign out", onPressed: () => {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
