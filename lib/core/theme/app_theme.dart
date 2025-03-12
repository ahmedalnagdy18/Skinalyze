import 'package:flutter/material.dart';
import 'package:skinalyze/core/colors/app_colors.dart';

enum AppTheme {
  light("light"),
  dark("dark");

  const AppTheme(this.name);
  final String name;
}

final appThemeData = {
  AppTheme.light: ThemeData(
    scaffoldBackgroundColor: AppColors.primaryColor,
    brightness: Brightness.light,
  ),
  AppTheme.dark: ThemeData(
    scaffoldBackgroundColor: AppColors.darkPrimaryColor,
    brightness: Brightness.dark,
  ),
};
