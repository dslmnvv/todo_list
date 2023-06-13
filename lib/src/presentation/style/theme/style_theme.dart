import 'package:flutter/material.dart';

import '../style_library.dart';

extension CustomTheme on ColorScheme {
  Color get backPrimary {
    return StyleLibrary.color.backPrimary;
  }

  Color get backSecondary {
    return StyleLibrary.color.backSecondary;
  }

  CheckboxThemeData get highPrioryCheckBox {
    return CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return StyleLibrary.color.green;
          } else {
            return StyleLibrary.color.red.withOpacity(0.5);
          }
        }),
        side: MaterialStateBorderSide.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return BorderSide.none;
          } else {
            return BorderSide(width: 2, color: StyleLibrary.color.red);
          }
        }),
        overlayColor: MaterialStateProperty.all(StyleLibrary.color.separator));
  }
}

class StyleTheme {
  var main = ThemeData(
    scaffoldBackgroundColor: StyleLibrary.color.backPrimary,
    textTheme: TextTheme(
        titleLarge: StyleLibrary.font.largeTitle,
        titleMedium: StyleLibrary.font.title, //button
        labelLarge: StyleLibrary.font.button,
        bodyMedium: StyleLibrary.font.body,
        headlineMedium: StyleLibrary.font.subhead //subhead
        ),
    iconTheme: IconThemeData(
      color: StyleLibrary.color.blue,
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(StyleLibrary.color.blue),
      textStyle: MaterialStateProperty.all(StyleLibrary.font.button.copyWith(
        color: StyleLibrary.color.blue,
      )),
      overlayColor:
          MaterialStateProperty.all(StyleLibrary.color.gray.withOpacity(0.5)),
    )),
    switchTheme: SwitchThemeData(
      overlayColor: MaterialStateProperty.all(StyleLibrary.color.blue),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return StyleLibrary.color.blue;
        } else {
          return StyleLibrary.color.backPrimary;
        }
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return StyleLibrary.color.blue.withOpacity(0.5);
        } else {
          return StyleLibrary.color.gray.withOpacity(0.5);
        }
      }),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: StyleLibrary.color.backSecondary,
      backgroundColor: StyleLibrary.color.blue,
    ),
    datePickerTheme: DatePickerThemeData(),
    checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return StyleLibrary.color.green;
          } else {
            return StyleLibrary.color.primary;
          }
        }),
        side: MaterialStateBorderSide.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return BorderSide.none;
          } else {
            return BorderSide(width: 2, color: StyleLibrary.color.separator);
          }
        }),
        overlayColor: MaterialStateProperty.all(StyleLibrary.color.separator)),
  );

  var dark = ThemeData();
}
