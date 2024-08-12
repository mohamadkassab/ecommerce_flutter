import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_application/components/button/primary_button.dart';

class SigninForm extends StatefulWidget {
  final void Function(bool) onForgotPassword;

  const SigninForm({super.key, required this.onForgotPassword});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SigninForm> {
  final double sizedBoxHeight = AppConfig.sizedBoxHeight;
  final double titleFontSize = AppConfig.titleFontSize;
  final double noteFontSize = AppConfig.noteFontSize;
  final double subTitleFontSize = AppConfig.subTitleFontSize;
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
                  "Enter your password to sign in to your account",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: subTitleFontSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
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
                  widget.onForgotPassword!(true);
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


