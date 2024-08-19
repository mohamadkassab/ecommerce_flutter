import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/components/button/primary_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatefulWidget {
  final void Function(bool) onOTP;

  const ForgotPasswordForm({super.key, required this.onOTP});

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final double sizedBoxHeight = AppConfig.sizedBoxHeight;
  final double titleFontSize = AppConfig.titleFontSize;
  final FontWeight titleFontWeight = AppConfig.titleFontWeight;
  final double subHeadingFontSize = AppConfig.subHeadingFontSize;
  final FontWeight subHeadingFontWeight = AppConfig.subHeadingFontWeight;
  final double noteFontSize = AppConfig.noteFontSize;
  final FontWeight noteFontWeight = AppConfig.noteFontWeight;
  final double headingFontSize = AppConfig.headingFontSize;
  final FontWeight headingFontWeight = AppConfig.headingFontWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Forgot password?',
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: titleFontSize,
              fontWeight: titleFontWeight),
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
                  fontSize: headingFontSize,
                  fontWeight: headingFontWeight,
                ),
              ),
              SizedBox(width: sizedBoxHeight),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft,
                ),
                child: const Text('Change'),
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
                  fontSize: subHeadingFontSize,
                  fontWeight: subHeadingFontWeight,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: sizedBoxHeight),
        PrimaryButton(
            text: 'Reset your password',
            onPressed: () async {
              widget.onOTP(true);
            }),
      ],
    );
  }
}
