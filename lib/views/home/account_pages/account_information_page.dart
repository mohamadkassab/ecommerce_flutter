import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/components/shared/text_iconbutton.dart';
import 'package:flutter/material.dart';

class AccountInformationPage extends StatefulWidget {
  const AccountInformationPage({super.key});

  @override
  _AccountInformationPageState createState() => _AccountInformationPageState();
}

class _AccountInformationPageState extends State<AccountInformationPage> {
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
  final String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(scaffoldPadding),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextIconbutton(
                  iconButton: const Icon(Icons.edit_outlined),
                  icon: Icons.person,
                  text: "Full Name",
                  onPressed: () => {},
                ),
                TextIconbutton(
                  iconButton: const Icon(Icons.edit_outlined),
                  icon: Icons.phone_android_outlined,
                  text: "Mobile number",
                  onPressed: () => {},
                ),
                TextIconbutton(
                  iconButton: const Icon(Icons.edit_outlined),
                  icon: Icons.email_outlined,
                  text: "Email Address",
                  onPressed: () => {},
                ),
                TextIconbutton(
                  iconButton: const Icon(Icons.edit_outlined),
                  icon: Icons.password,
                  text: "Password",
                  onPressed: () => {},
                ),
                TextIconbutton(
                  iconButton: const Icon(Icons.edit_outlined),
                  icon: Icons.public,
                  text: "Country",
                  onPressed: () => {},
                ),
                TextIconbutton(
                  iconButton: const Icon(Icons.edit_outlined),
                  icon: Icons.place,
                  text: "Shipping Address",
                  onPressed: () => {},
                ),
                TextIconbutton(
                  iconButton: const Icon(Icons.edit_outlined),
                  icon: Icons.payment_outlined,
                  text: "Payment Method",
                  onPressed: () => {},
                ),
                TextIconbutton(
                  iconButton: const Icon(Icons.edit_outlined),
                  icon: Icons.payment_outlined,
                  text: "Billing Address",
                  onPressed: () => {},
                ),
                SizedBox(
                  height: scaffoldPadding,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => {},
                      child: Text(
                        "Delete your account",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
