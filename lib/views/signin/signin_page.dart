import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/views/signin/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'signin_form.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final String mainLogoPath = AppConfig.mainLogoPath;
  final double scaffoldPadding = AppConfig.scaffoldPadding;
  final double mainLogoHeight = AppConfig.mainLogoHeight;
  bool _isForgotPassword = false;

  void _forgotPassword(bool value) {
    setState(() {
      _isForgotPassword = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _isForgotPassword
            ? FittedBox(
                fit: BoxFit.scaleDown,
                child: TextButton(
                  onPressed: () {
                    _forgotPassword(false);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: AppConfig.linkColor,
                      fontSize: AppConfig.titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
      ),
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
                _isForgotPassword
                    ? ForgotPasswordForm()
                    : SigninForm(onForgotPassword: _forgotPassword),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
