import 'package:flutter/material.dart';
import 'package:todo_list/src/presentation/style/theme/app_theme_extension.dart';
import '../style_library.dart';

class StyleTheme {
  final main = ThemeData(
      scaffoldBackgroundColor: StyleLibrary.color.main.backPrimary,
      textTheme: TextTheme(
          titleLarge: StyleLibrary.font.largeTitle,
          titleMedium: StyleLibrary.font.title, //button
          labelLarge: StyleLibrary.font.button,
          bodyMedium: StyleLibrary.font.body,
          headlineMedium: StyleLibrary.font.subhead.copyWith(
            color: StyleLibrary.color.main.tertiary,
          ) //subhead
      ),
      iconTheme: IconThemeData(
        color: StyleLibrary.color.main.blue,
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all(StyleLibrary.color.main.blue),
        textStyle: MaterialStateProperty.all(StyleLibrary.font.button.copyWith(
          color: StyleLibrary.color.main.blue,
        )),
        overlayColor: MaterialStateProperty.all(
            StyleLibrary.color.main.gray.withOpacity(0.5)),
      )),
      switchTheme: SwitchThemeData(
        overlayColor: MaterialStateProperty.all(StyleLibrary.color.main.blue),
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return StyleLibrary.color.main.blue;
          } else {
            return StyleLibrary.color.main.backPrimary;
          }
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return StyleLibrary.color.main.blue.withOpacity(0.5);
          } else {
            return StyleLibrary.color.main.gray.withOpacity(0.5);
          }
        }),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: StyleLibrary.color.main.backSecondary,
        backgroundColor: StyleLibrary.color.main.blue,
      ),
      datePickerTheme: const DatePickerThemeData(),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return StyleLibrary.color.main.green;
            } else {
              return StyleLibrary.color.main.primary;
            }
          }),
          side: MaterialStateBorderSide.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return BorderSide.none;
            } else {
              return BorderSide(
                  width: 2, color: StyleLibrary.color.main.separator);
            }
          }),
          overlayColor:
              MaterialStateProperty.all(StyleLibrary.color.main.separator)),
      extensions: [
        AppThemeExtension(
            red: StyleLibrary.color.main.red,
            green: StyleLibrary.color.main.green,
            blue: StyleLibrary.color.main.blue,
            icon: StyleLibrary.color.main.tertiary,
            backPrimary: StyleLibrary.color.main.backPrimary,
            backSecondary: StyleLibrary.color.main.backSecondary,
            backButton: StyleLibrary.color.main.primary,
            dropDownMenuColor: Colors.white,
            datePickerTheme: ThemeData.light(),
            highPrioryCheckBox: CheckboxThemeData(
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return StyleLibrary.color.main.green;
                  } else {
                    return StyleLibrary.color.main.red.withOpacity(0.5);
                  }
                }),
                side: MaterialStateBorderSide.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return BorderSide.none;
                  } else {
                    return BorderSide(
                        width: 2, color: StyleLibrary.color.main.red);
                  }
                }),
                overlayColor: MaterialStateProperty.all(
                    StyleLibrary.color.main.separator)))
      ]);

  final dark = ThemeData(
      scaffoldBackgroundColor: StyleLibrary.color.dark.backPrimary,
      textTheme: TextTheme(
        titleLarge: StyleLibrary.font.largeTitle
            .copyWith(color: StyleLibrary.color.dark.primary),
        titleMedium: StyleLibrary.font.title
            .copyWith(color: StyleLibrary.color.dark.primary), //button
        labelLarge: StyleLibrary.font.button
            .copyWith(color: StyleLibrary.color.dark.primary),
        bodyMedium: StyleLibrary.font.body
            .copyWith(color: StyleLibrary.color.dark.primary),
          headlineMedium: StyleLibrary.font.subhead.copyWith(
            color: StyleLibrary.color.dark.tertiary,
          ), //subhead
      ),
      dividerColor: StyleLibrary.color.dark.separator,
      iconTheme: IconThemeData(
        color: StyleLibrary.color.dark.blue,
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all(StyleLibrary.color.dark.blue),
        textStyle: MaterialStateProperty.all(StyleLibrary.font.button.copyWith(
          color: StyleLibrary.color.dark.blue,
        )),
        overlayColor: MaterialStateProperty.all(
            StyleLibrary.color.dark.gray.withOpacity(0.5)),
      )),
      switchTheme: SwitchThemeData(
        overlayColor: MaterialStateProperty.all(StyleLibrary.color.dark.blue),
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return StyleLibrary.color.dark.blue;
          } else {
            return StyleLibrary.color.dark.backLight;
          }
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return StyleLibrary.color.dark.blue.withOpacity(0.5);
          } else {
            return StyleLibrary.color.dark.gray.withOpacity(0.5);
          }
        }),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: StyleLibrary.color.dark.blue,
      ),
      datePickerTheme: const DatePickerThemeData(),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return StyleLibrary.color.dark.green;
            } else {
              return StyleLibrary.color.dark.primary;
            }
          }),
          side: MaterialStateBorderSide.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return BorderSide.none;
            } else {
              return BorderSide(
                  width: 2, color: StyleLibrary.color.dark.separator);
            }
          }),
          overlayColor:
              MaterialStateProperty.all(StyleLibrary.color.dark.separator)),
      extensions: [
        AppThemeExtension(
            red: StyleLibrary.color.dark.red,
            green: StyleLibrary.color.dark.green,
            blue: StyleLibrary.color.dark.blue,
            icon: StyleLibrary.color.dark.tertiary,
            backPrimary: StyleLibrary.color.dark.backPrimary,
            backSecondary: StyleLibrary.color.dark.backSecondary,
            dropDownMenuColor: StyleLibrary.color.dark.backLight,
            backButton: StyleLibrary.color.dark.primary,
            datePickerTheme: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light().copyWith(
                background: Colors.black,
                primary: StyleLibrary.color.dark.blue,
                onPrimary: StyleLibrary.color.dark.primary,
                onSurface: StyleLibrary.color.dark.primary,
                secondary: StyleLibrary.color.dark.backLight,
              ),
              dialogBackgroundColor: StyleLibrary.color.dark.backSecondary,
            ),
            highPrioryCheckBox: CheckboxThemeData(
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return StyleLibrary.color.dark.green;
                  } else {
                    return StyleLibrary.color.dark.red.withOpacity(0.5);
                  }
                }),
                side: MaterialStateBorderSide.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return BorderSide.none;
                  } else {
                    return BorderSide(
                        width: 2, color: StyleLibrary.color.dark.red);
                  }
                }),
                overlayColor: MaterialStateProperty.all(
                    StyleLibrary.color.dark.separator)))
      ]);
}
