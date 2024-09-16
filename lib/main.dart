import 'package:expenseapp/3_Application/core/theme/theme_data.dart';
import 'package:expenseapp/3_Application/core/theme/theme_provider.dart';
import 'package:expenseapp/3_Application/pages/splashscreen%20pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, theme: myMode, home: LandingPage());
  }
}
