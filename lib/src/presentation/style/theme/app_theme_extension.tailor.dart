// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_theme_extension.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppThemeExtensionTailorMixin on ThemeExtension<AppThemeExtension> {
  Color get backPrimary;
  Color get backSecondary;
  Color get red;
  Color get green;
  Color get blue;
  Color get dropDownMenuColor;
  Color get icon;
  Color get backButton;
  CheckboxThemeData get highPrioryCheckBox;
  ThemeData get datePickerTheme;

  @override
  AppThemeExtension copyWith({
    Color? backPrimary,
    Color? backSecondary,
    Color? red,
    Color? green,
    Color? blue,
    Color? dropDownMenuColor,
    Color? icon,
    Color? backButton,
    CheckboxThemeData? highPrioryCheckBox,
    ThemeData? datePickerTheme,
  }) {
    return AppThemeExtension(
      backPrimary: backPrimary ?? this.backPrimary,
      backSecondary: backSecondary ?? this.backSecondary,
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
      dropDownMenuColor: dropDownMenuColor ?? this.dropDownMenuColor,
      icon: icon ?? this.icon,
      backButton: backButton ?? this.backButton,
      highPrioryCheckBox: highPrioryCheckBox ?? this.highPrioryCheckBox,
      datePickerTheme: datePickerTheme ?? this.datePickerTheme,
    );
  }

  @override
  AppThemeExtension lerp(
      covariant ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this as AppThemeExtension;
    return AppThemeExtension(
      backPrimary: Color.lerp(backPrimary, other.backPrimary, t)!,
      backSecondary: Color.lerp(backSecondary, other.backSecondary, t)!,
      red: Color.lerp(red, other.red, t)!,
      green: Color.lerp(green, other.green, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      dropDownMenuColor:
          Color.lerp(dropDownMenuColor, other.dropDownMenuColor, t)!,
      icon: Color.lerp(icon, other.icon, t)!,
      backButton: Color.lerp(backButton, other.backButton, t)!,
      highPrioryCheckBox:
          t < 0.5 ? highPrioryCheckBox : other.highPrioryCheckBox,
      datePickerTheme: t < 0.5 ? datePickerTheme : other.datePickerTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppThemeExtension &&
            const DeepCollectionEquality()
                .equals(backPrimary, other.backPrimary) &&
            const DeepCollectionEquality()
                .equals(backSecondary, other.backSecondary) &&
            const DeepCollectionEquality().equals(red, other.red) &&
            const DeepCollectionEquality().equals(green, other.green) &&
            const DeepCollectionEquality().equals(blue, other.blue) &&
            const DeepCollectionEquality()
                .equals(dropDownMenuColor, other.dropDownMenuColor) &&
            const DeepCollectionEquality().equals(icon, other.icon) &&
            const DeepCollectionEquality()
                .equals(backButton, other.backButton) &&
            const DeepCollectionEquality()
                .equals(highPrioryCheckBox, other.highPrioryCheckBox) &&
            const DeepCollectionEquality()
                .equals(datePickerTheme, other.datePickerTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backPrimary),
      const DeepCollectionEquality().hash(backSecondary),
      const DeepCollectionEquality().hash(red),
      const DeepCollectionEquality().hash(green),
      const DeepCollectionEquality().hash(blue),
      const DeepCollectionEquality().hash(dropDownMenuColor),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(backButton),
      const DeepCollectionEquality().hash(highPrioryCheckBox),
      const DeepCollectionEquality().hash(datePickerTheme),
    );
  }
}

extension AppThemeExtensionBuildContextProps on BuildContext {
  AppThemeExtension get appThemeExtension =>
      Theme.of(this).extension<AppThemeExtension>()!;
  Color get backPrimary => appThemeExtension.backPrimary;
  Color get backSecondary => appThemeExtension.backSecondary;
  Color get red => appThemeExtension.red;
  Color get green => appThemeExtension.green;
  Color get blue => appThemeExtension.blue;
  Color get dropDownMenuColor => appThemeExtension.dropDownMenuColor;
  Color get icon => appThemeExtension.icon;
  Color get backButton => appThemeExtension.backButton;
  CheckboxThemeData get highPrioryCheckBox =>
      appThemeExtension.highPrioryCheckBox;
  ThemeData get datePickerTheme => appThemeExtension.datePickerTheme;
}
