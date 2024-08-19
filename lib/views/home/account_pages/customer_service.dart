import 'package:ecommerce_application/app/app_config.dart';
import 'package:ecommerce_application/components/button/primary_button.dart';
import 'package:ecommerce_application/components/line/horizontal_line.dart';
import 'package:ecommerce_application/components/shared/expandable_info.dart';
import 'package:flutter/material.dart';

class CustomerServicePage extends StatefulWidget {
  const CustomerServicePage({super.key});

  @override
  _CustomerServicePageState createState() => _CustomerServicePageState();
}

class _CustomerServicePageState extends State<CustomerServicePage> {
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

  // Selected language
  String? _selectedLanguage;
  int itemsToShow = 10;

  Map<String, dynamic> faqs = {
    'what is ....?': "hello world",
    'what is 2 ....?': "hello world 2",
    'what is3 ....?':
        "hello world asdssssss asdddddddd dasssssssss asddddddddd asddddddddd",
    'what is s....?': "hello world",
    'what is das2 ....?': "hello world 2",
    'what is adsd....?': "hello world",
    'what is s2 ....?': "hello world 2",
    'what is asd....?': "hello world",
    'what is 2 .jh...?': "hello world 2",
    'what is a....?': "hello world",
    'what is 2a ....?': "hello world 2",
    'what is ..d..?': "hello world",
    'what is 2 .s...?': "hello world 2",
    'what is .d...?': "hello world",
    'what is 2 .gs...?': "hello world 2",
    'what is ...s.?': "hello world",
    'whaat is 2 ..fg..?': "hello world 2",
    'whaat is 2 .jh...?': "hello world 2",
    'whsat is a....?': "hello world",
    'whdat is 2a ....?': "hello world 2",
    'whsat is ..d..?': "hello world",
    'whaat is 2 .s...?': "hello world 2",
    'whdat is .d...?': "hello world",
    'whasat is 2 .gs...?': "hello world 2",
    'whafgt is ...s.?': "hello world",
    'whadt is 2 ..fg..?': "hello world 2",
  };

  @override
  Widget build(BuildContext context) {
    List<MapEntry<String, dynamic>> entries = faqs.entries.toList();
    List<MapEntry<String, dynamic>> visibleEntries =
        entries.take(itemsToShow).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Service"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(scaffoldPadding),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Frequently Asked Questions",
                  style: TextStyle(
                      fontSize: headingFontSize, fontWeight: headingFontWeight),
                ),
                const SizedBox(
                  height: AppConfig.sizedBoxHeight,
                ),
                ...visibleEntries.map((entry) {
                  String key = entry.key;
                  dynamic value =
                      entry.value; // value is dynamic, can be any type
                  return Column(
                    children: [
                      SizedBox(height: sizedBoxHeight / 2),
                      ExpandableInfo(
                        title: key,
                        description: value.toString(),
                        titleFontSize: AppConfig.subHeadingFontSize,
                      ),
                      SizedBox(height: sizedBoxHeight / 2),
                      const HorizontalLine(thickness: 4),
                    ],
                  );
                }),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (itemsToShow < entries.length)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            itemsToShow += 10;
                          });
                        },
                        child: const Text(
                          'Load More',
                          style: TextStyle(color: AppConfig.linkColor),
                        ),
                      ),
                  ],
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mail_outline),
                    Text(
                      " 24/7 email support",
                      style: TextStyle(
                          fontSize: AppConfig.subHeadingFontSize,
                          fontWeight: AppConfig.headingFontWeight),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppConfig.sizedBoxHeight * 2,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        // floatingLabelStyle: _focusNodePassword.hasFocus
                        //     ? TextStyle(
                        //         color: Theme.of(context).colorScheme.primary)
                        //     : TextStyle(
                        //         color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    const SizedBox(
                      height: AppConfig.sizedBoxHeight,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                        // floatingLabelStyle: _focusNodePassword.hasFocus
                        //     ? TextStyle(
                        //         color: Theme.of(context).colorScheme.primary)
                        //     : TextStyle(
                        //         color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    const SizedBox(
                      height: AppConfig.sizedBoxHeight,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Subject',

                        // floatingLabelStyle: _focusNodePassword.hasFocus
                        //     ? TextStyle(
                        //         color: Theme.of(context).colorScheme.primary)
                        //     : TextStyle(
                        //         color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    const SizedBox(
                      height: AppConfig.sizedBoxHeight,
                    ),
                    TextFormField(
                      maxLines: 5,
                      decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Message',
                        // floatingLabelStyle: _focusNodePassword.hasFocus
                        //     ? TextStyle(
                        //         color: Theme.of(context).colorScheme.primary)
                        //     : TextStyle(
                        //         color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    const SizedBox(
                      height: AppConfig.sizedBoxHeight,
                    ),
                    PrimaryButton(text: "Send Message", onPressed: () => {}),
                    const SizedBox(
                      height: AppConfig.sizedBoxHeight * 4,
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
