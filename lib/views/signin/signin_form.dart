import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_application/components/button/primary_button.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SigninForm> {
  final double sizedBoxHeight = AppConfig.sizedBoxHeight;
  final double titleFontSize = AppConfig.titleFontSize;
  final FontWeight titleFontWeight = AppConfig.titleFontWeight;
  final double subHeadingFontSize = AppConfig.subHeadingFontSize;
  final FontWeight subHeadingFontWeight = AppConfig.subHeadingFontWeight;
  final double noteFontSize = AppConfig.noteFontSize;
  final FontWeight noteFontWeight = AppConfig.noteFontWeight;
  final double headingFontSize = AppConfig.headingFontSize;
  final FontWeight headingFontWeight = AppConfig.headingFontWeight;

  final _formKey = GlobalKey<FormState>();
  final FocusNode _focusNodePassword = FocusNode();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _focusNodePassword.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNodePassword.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Welcome back!',
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
                  "Enter your password to sign in to your account",
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
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter your password',
              floatingLabelStyle: _focusNodePassword.hasFocus
                  ? TextStyle(color: Theme.of(context).colorScheme.primary)
                  : TextStyle(color: Theme.of(context).colorScheme.secondary),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            focusNode: _focusNodePassword,
            obscureText: _obscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            onSaved: (value) {},
          ),
          SizedBox(height: sizedBoxHeight / 2),
          Wrap(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/forgot_password");
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft,
                ),
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text('Forgot password?'),
                ),
              ),
            ],
          ),
          SizedBox(height: sizedBoxHeight),
          PrimaryButton(
              text: 'Sign in', width: double.infinity, onPressed: () async {}),
        ],
      ),
    );
  }
}
