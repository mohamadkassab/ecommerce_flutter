import 'package:flutter/material.dart';
import 'app/app.dart';
import 'package:provider/provider.dart';
import 'controllers/auth_controller.dart';

// entry point

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
      ],
      child: const MyApp(),
    ),
  );
}
