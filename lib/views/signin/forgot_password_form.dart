import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/components/button/primary_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final double sizedBoxHeight = AppConfig.sizedBoxHeight;
  final double titleFontSize = AppConfig.titleFontSize;
  final double noteFontSize = AppConfig.noteFontSize;
  final double subTitleFontSize = AppConfig.subTitleFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Forgot password?',
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: sizedBoxHeight),
        Container(
          alignment: Alignment.centerLeft,
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                "Email@gmail.com",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: subTitleFontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: sizedBoxHeight),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft,
                ),
                child: Text('Change'),
              ),
            ],
          ),
        ),
        SizedBox(height: sizedBoxHeight),
        Container(
          alignment: Alignment.centerLeft,
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                "We can send you an email with a one-time password (OTP) that you can use to reset your password.",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: subTitleFontSize,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: sizedBoxHeight),
        PrimaryButton(
            text: 'Reset your password',
            width: double.infinity,
            onPressed: () async {}),
      ],
    );
  }
}
