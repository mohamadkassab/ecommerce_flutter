import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/components/button/primary_button.dart';
import 'package:flutter/material.dart';

class OTPForm extends StatefulWidget {
  final void Function(bool) onNewPassword;
  const OTPForm({super.key, required this.onNewPassword});

  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  final double sizedBoxHeight = AppConfig.sizedBoxHeight;
  final double titleFontSize = AppConfig.titleFontSize;
  final FontWeight titleFontWeight = AppConfig.titleFontWeight;
  final double subHeadingFontSize = AppConfig.subHeadingFontSize;
  final FontWeight subHeadingFontWeight = AppConfig.subHeadingFontWeight;
  final double noteFontSize = AppConfig.noteFontSize;
  final FontWeight noteFontWeight = AppConfig.noteFontWeight;
  final double headingFontSize = AppConfig.headingFontSize;
  final FontWeight headingFontWeight = AppConfig.headingFontWeight;
  final int otpNumber = 6;
  late final _otpControllers =
      List.generate(otpNumber, (index) => TextEditingController());
  late final _focusNodes = List.generate(otpNumber, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    _otpControllers.forEach((controller) {
      controller.addListener(() {
        _onOTPChanged(controller);
      });
    });
  }

  void _onOTPChanged(TextEditingController controller) {
    final index = _otpControllers.indexOf(controller);
    if (controller.text.length == 1 && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (index == 5 && controller.text.length == 1) {
      widget.onNewPassword(true);
    }
  }

  @override
  void dispose() {
    _otpControllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Verify',
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
                "Code sent",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: subHeadingFontSize,
                  fontWeight: subHeadingFontWeight,
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
                child: Text('Resend'),
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
                "Enter the temporary password reset code we sent to your email address: \n",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: subHeadingFontSize,
                  fontWeight: subHeadingFontWeight,
                ),
              ),
              Text(
                "Email@gmail.com",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: headingFontSize,
                  fontWeight: headingFontWeight,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: sizedBoxHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            otpNumber,
            (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: 40,
                  child: TextField(
                    controller: _otpControllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
