import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';
import 'signin_form.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final double scaffoldPadding = AppConfig.scaffoldPadding;

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
                  AppConfig.mainLogoPath,
                  height: AppConfig.mainLogoHeight,
                )),
                const SigninForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
