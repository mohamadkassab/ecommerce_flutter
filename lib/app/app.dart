import 'package:flutter/material.dart';
import 'router.dart';
import 'themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon',
      theme: appTheme,
      initialRoute: '/home',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
