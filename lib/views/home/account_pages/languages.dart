import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/components/line/horizontal_line.dart';
import 'package:flutter/material.dart';

class LanguagesPage extends StatefulWidget {
  const LanguagesPage({super.key});

  @override
  _LanguagesPageState createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  final double sizedBoxHeight = AppConfig.sizedBoxHeight;
  final double titleFontSize = AppConfig.titleFontSize;
  final FontWeight titleFontWeight = AppConfig.titleFontWeight;
  final double subHeadingFontSize = AppConfig.subHeadingFontSize;
  final FontWeight subHeadingFontWeight = AppConfig.subHeadingFontWeight;
  final double noteFontSize = AppConfig.noteFontSize;
  final FontWeight noteFontWeight = AppConfig.noteFontWeight;
  final double headingFontSize = AppConfig.headingFontSize;
  final FontWeight headingFontWeight = AppConfig.headingFontWeight;
  final String mainLogoPath = AppConfig.mainLogoPath;
  final double scaffoldPadding = AppConfig.scaffoldPadding;
  final double mainLogoHeight = AppConfig.mainLogoHeight;
  final List<String> _languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Japanese',
    // Add more languages here
  ];

  // Selected language
  String? _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language/Currency"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
          child: ListView.separated(
            itemCount: _languages.length,
            separatorBuilder: (context, index) => const HorizontalLine(
              thickness: 4,
            ),
            itemBuilder: (context, index) {
              final language = _languages[index];
              return ListTile(
                title: Text(
                  language,
                  style: const TextStyle(
                      fontSize: AppConfig.subHeadingFontSize,
                      fontWeight: AppConfig.subHeadingFontWeight),
                ),
                trailing: _selectedLanguage == language
                    ? const Icon(Icons.check, color: AppConfig.tertiary)
                    : null,
                onTap: () {
                  setState(() {
                    _selectedLanguage = language;
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
