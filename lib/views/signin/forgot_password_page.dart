import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/views/signin/forgot_password_form.dart';
import 'package:ecommerce_application/views/signin/new_password_form.dart';
import 'package:ecommerce_application/views/signin/otp_form.dart';
import 'package:flutter/material.dart';
import 'signin_form.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final String mainLogoPath = AppConfig.mainLogoPath;
  final double scaffoldPadding = AppConfig.scaffoldPadding;
  final double mainLogoHeight = AppConfig.mainLogoHeight;
  bool _isOTPVisisble = false;
  bool _isNewPasswordVisible = false;

  void _OTPVisibility(bool value) {
    setState(() {
      _isOTPVisisble = value;
    });
  }

  void _newPasswordVisibility(bool value) {
    setState(() {
      _isNewPasswordVisible = value;
    });
  }

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
                _isNewPasswordVisible
                    ? NewPasswordForm()
                    : _isOTPVisisble
                        ? OTPForm(onNewPassword: _newPasswordVisibility)
                        : ForgotPasswordForm(onOTP: _OTPVisibility),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
