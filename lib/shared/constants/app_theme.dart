import 'package:flutter/material.dart';
import 'style_constants.dart';

class AppTheme extends ChangeNotifier {
  static ThemeData getLightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: kBackgroundColor,
      fontFamily: kDefaultFontFamily,
    );
  }
  }
