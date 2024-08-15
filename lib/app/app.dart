import 'package:flutter/material.dart';
import 'router.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon',
      theme: appTheme,
      initialRoute: '/account',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
