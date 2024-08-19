import 'package:ecommerce_application/app/app_config.dart';
import 'package:flutter/material.dart';

class LanguageCurrencyPage extends StatefulWidget {
  const LanguageCurrencyPage({super.key});

  @override
  _LanguageCurrencyPageState createState() => _LanguageCurrencyPageState();
}

class _LanguageCurrencyPageState extends State<LanguageCurrencyPage> {
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
  final TextEditingController _searchController = TextEditingController();
  String? _selectedValue;
  final List<String> _options = ['Option 1', 'Option 2', 'Option 3'];
  final String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language/Currency"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(scaffoldPadding),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to the next page when tapped
                    Navigator.pushNamed(context, "/languages");
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Language',
                        floatingLabelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      onSaved: (value) {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppConfig.sizedBoxHeight,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Currency',
                    floatingLabelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  onSaved: (value) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
