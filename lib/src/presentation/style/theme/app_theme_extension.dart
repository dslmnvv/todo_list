import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_theme_extension.tailor.dart';

@TailorMixin()
class AppThemeExtension extends ThemeExtension<AppThemeExtension> with _$AppThemeExtensionTailorMixin{
  @override
  Color backPrimary;
  @override
  Color backSecondary;
  @override
  Color red;
  @override
  Color green;
  @override
  Color blue;

  @override
  Color dropDownMenuColor;

  @override
  Color icon;

  @override
  Color backButton;


  @override
  CheckboxThemeData highPrioryCheckBox;

  @override
  ThemeData datePickerTheme;

  AppThemeExtension(
      {required this.backPrimary,
        required this.backSecondary,
        required this.highPrioryCheckBox,
        required this.red,
        required this.blue,
        required this.green,
        required this.icon,
        required this.dropDownMenuColor,
        required this.backButton,
        required this.datePickerTheme,
      });

}