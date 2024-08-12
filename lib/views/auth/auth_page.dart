import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';
import 'auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  final String mainLogoPath = AppConfig.mainLogoPath;
  final double scaffoldPadding = AppConfig.scaffoldPadding;
  final double mainLogoHeight = AppConfig.mainLogoHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(scaffoldPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: Image.asset(
                  mainLogoPath,
                  height: mainLogoHeight,
                )),
                const AuthForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
