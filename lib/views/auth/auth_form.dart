import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/components/button/logo_button.dart';
import 'package:ecommerce_application/components/button/primary_button.dart';
import 'package:ecommerce_application/components/line/horizontal_text_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/auth_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final String _password = '';
  final FocusNode _focusNodeEmail = FocusNode();
  final double sizedBoxHeight = AppConfig.sizedBoxHeight;
  final double titleFontSize = AppConfig.titleFontSize;
  final FontWeight titleFontWeight = AppConfig.titleFontWeight;
  final double noteFontSize = AppConfig.noteFontSize;
  final FontWeight noteFontWeight = AppConfig.noteFontWeight;
  String _email = '';

  @override
  void initState() {
    super.initState();
    _focusNodeEmail.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNodeEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Sign in or create an account',
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: titleFontSize,
                fontWeight: titleFontWeight),
          ),
          SizedBox(height: sizedBoxHeight),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email or mobile number',
              floatingLabelStyle: _focusNodeEmail.hasFocus
                  ? TextStyle(color: Theme.of(context).colorScheme.primary)
                  : TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            focusNode: _focusNodeEmail,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            onSaved: (value) {
              _email = value!;
            },
          ),
          SizedBox(height: sizedBoxHeight),
          PrimaryButton(
              text: 'Continue',
              width: double.infinity,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  await context.read<AuthController>().login(_email, _password);
                  if (context.read<AuthController>().user != null) {
                    Navigator.pushNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login failed')),
                    );
                  }
                }
              }),
          SizedBox(height: sizedBoxHeight),
          const HorizontaTextlLine(),
          SizedBox(height: sizedBoxHeight),
          LogoButton(
              icon: SvgPicture.asset('assets/images/google_icon.svg',
                  height: 24, width: 24),
              text: 'Sign in with Google',
              onPressed: () => {}),
          SizedBox(height: sizedBoxHeight),
          LogoButton(
              icon: SvgPicture.asset('assets/images/facebook_icon.svg',
                  height: 24, width: 24),
              text: 'Sign in with Facebook',
              onPressed: () => {}),
          SizedBox(height: sizedBoxHeight),
          Wrap(
            children: [
              Text(
                "By continuing, you've read and agree to our ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: noteFontSize,
                  fontWeight: noteFontWeight,
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
                  fontWeight: noteFontWeight,
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
        ],
      ),
    );
  }
}
