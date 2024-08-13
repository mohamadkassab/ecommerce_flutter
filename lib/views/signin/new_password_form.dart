import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/components/button/primary_button.dart';
import 'package:flutter/material.dart';

class NewPasswordForm extends StatefulWidget {
  const NewPasswordForm({super.key});

  @override
  _NewPasswordFormState createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<NewPasswordForm> {
  final double sizedBoxHeight = AppConfig.sizedBoxHeight;
  final double titleFontSize = AppConfig.titleFontSize;
  final FontWeight titleFontWeight = AppConfig.titleFontWeight;
  final double subTitleFontSize = AppConfig.subTitleFontSize;
  final FontWeight subTitleFontWeight = AppConfig.subTitleFontWeight;
  final double noteFontSize = AppConfig.noteFontSize;
  final FontWeight noteFontWeight = AppConfig.noteFontWeight;
  final double headingFontSize = AppConfig.headingFontSize;
  final FontWeight headingFontWeight = AppConfig.headingFontWeight;
  final _formKey = GlobalKey<FormState>();
  final int otpNumber = 6;
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();
  bool _obscurePasswordText = true;
  bool _obscureConfirmPasswordText = true;

  @override
  void initState() {
    super.initState();

    _focusNodePassword.addListener(() {
      setState(() {});
    });

    _focusNodeConfirmPassword.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility(String field) {
    setState(() {
      switch (field) {
        case 'password':
          _obscurePasswordText = !_obscurePasswordText;
          break;
        case 'confirmPassword':
          _obscureConfirmPasswordText = !_obscureConfirmPasswordText;
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Create a new password',
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
              ],
            ),
          ),
          SizedBox(height: sizedBoxHeight),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter new password',
              floatingLabelStyle: _focusNodePassword.hasFocus
                  ? TextStyle(color: Theme.of(context).colorScheme.primary)
                  : TextStyle(color: Theme.of(context).colorScheme.secondary),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePasswordText
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () => _togglePasswordVisibility('password'),
              ),
            ),
            focusNode: _focusNodePassword,
            obscureText: _obscurePasswordText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            onSaved: (value) {},
          ),
          SizedBox(height: sizedBoxHeight),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Confirm new password',
              floatingLabelStyle: _focusNodePassword.hasFocus
                  ? TextStyle(color: Theme.of(context).colorScheme.primary)
                  : TextStyle(color: Theme.of(context).colorScheme.secondary),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePasswordText
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () => _togglePasswordVisibility('confirmPassword'),
              ),
            ),
            focusNode: _focusNodeConfirmPassword,
            obscureText: _obscureConfirmPasswordText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            onSaved: (value) {},
          ),
          SizedBox(height: sizedBoxHeight),
          Container(
            alignment: Alignment.centerLeft,
            child: Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  "Upon resetting your password, any saved payment information requires validation at checkout for security purposes.",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: subTitleFontSize,
                    fontWeight: subTitleFontWeight,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: sizedBoxHeight),
          PrimaryButton(
              text: 'Submit', width: double.infinity, onPressed: () async {}),
        ],
      ),
    );
  }
}
