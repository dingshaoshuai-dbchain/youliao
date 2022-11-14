import 'package:flutter/material.dart';
import 'package:youliao/res/app_colors.dart';

class ThemeProvider {
  ThemeData getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.mainBackground,
    );
  }
}
