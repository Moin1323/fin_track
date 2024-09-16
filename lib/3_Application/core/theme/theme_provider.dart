import 'package:expenseapp/3_Application/core/theme/theme_data.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemeData _themeData = myMode;

  ThemeData get themeData => _themeData;
}
