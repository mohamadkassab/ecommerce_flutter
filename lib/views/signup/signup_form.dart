import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_application/components/button/primary_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final double sizedBoxHeight = AppConfig.sizedBoxHeight;
  final double titleFontSize = AppConfig.titleFontSize;
  final double noteFontSize = AppConfig.noteFontSize;
  final double subTitleFontSize = AppConfig.subTitleFontSize;
  final _formKey = GlobalKey<FormState>();
  final FocusNode _focusNodePassword = FocusNode();
  bool _obscureText = true;
  bool _isPolicyAccepted = false;
  bool _isReceivingMailsAccepted = false;

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

  void _handleCheckboxChange(bool? value, String _variable) {
    try {
      setState(() {
        switch (_variable) {
          case '_isPolicyAccepted':
            _isPolicyAccepted = value ?? false;
            break;
          case '_isReceivingMailsAccepted':
            _isReceivingMailsAccepted = value ?? false;
            break;

          default:
            break;
        }
      });
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Create a new account',
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
                  "We didn't find an account with that email address. Create a password to create a new account.",
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
              labelText: 'Create a password',
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
                return 'Create a password';
              }
              return null;
            },
            onSaved: (value) {},
          ),
          SizedBox(height: sizedBoxHeight),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Checkbox(
              value: _isPolicyAccepted,
              onChanged: (newValue) {
                _handleCheckboxChange(newValue, "_isPolicyAccepted");
              },
            ),
            title: Wrap(
              children: [
                Text(
                  "By continuing, you've read and agree to our ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: noteFontSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
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
                  child: Text('Terms and Conditions '),
                ),
                Text(
                  "and ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: noteFontSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
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
                  child: Text('Privacy Policy.'),
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Checkbox(
              value: _isReceivingMailsAccepted,
              onChanged: (newValue) {
                _handleCheckboxChange(newValue, "_isReceivingMailsAccepted");
              },
            ),
            title: Wrap(
              children: [
                Text(
                  "I want to receive exclusive deals and rewards offers by email.",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: noteFontSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: sizedBoxHeight),
          PrimaryButton(
              text: 'Create account',
              width: double.infinity,
              onPressed: () async {}),
        ],
      ),
    );
  }
}
